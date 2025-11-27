import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/enums/mood.dart';
import '../../domain/models/analysis_summary.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';

final analysisSummaryProvider = Provider<AsyncValue<AnalysisSummary>>((ref) {
  final transactions = ref.watch(transactionsStreamProvider);
  final categories = ref.watch(categoriesStreamProvider);

  if (transactions.isLoading || categories.isLoading) {
    return const AsyncLoading();
  }

  final error = [transactions, categories].firstWhereOrNull((value) => value.hasError);
  if (error != null) {
    return AsyncError(error.error!, error.stackTrace ?? StackTrace.current);
  }

  final txList = transactions.value ?? [];
  final categoryList = categories.value ?? [];
  final categoryMap = {for (final category in categoryList) category.id: category};
  final now = DateTime.now();
  final currentMonthExpenses = txList.where((tx) => !tx.isIncome && tx.date.year == now.year && tx.date.month == now.month).toList();

  final emotionInsights = Mood.values.map((mood) {
    final moodTx = currentMonthExpenses.where((tx) => tx.mood == mood).toList();
    final amount = moodTx.fold<double>(0.0, (sum, tx) => sum + tx.amount);
    final askedCount = moodTx.where((tx) => tx.regret != null).length;
    final regretCount = moodTx.where((tx) => tx.regret == true).length;
    final ratio = askedCount == 0 ? 0.0 : regretCount / askedCount;
    return EmotionInsight(mood: mood, amount: amount, regretRatio: ratio);
  }).where((insight) => insight.amount > 0).toList();

  final stressedSpending = currentMonthExpenses
      .where((tx) => tx.mood == Mood.stressed)
      .fold<double>(0.0, (sum, tx) => sum + tx.amount);

  final boredByCategory = currentMonthExpenses
      .where((tx) => tx.mood == Mood.bored)
      .groupListsBy((tx) => tx.categoryId)
      .map((key, value) => MapEntry(
            key,
            value.fold<double>(0.0, (sum, tx) => sum + tx.amount),
          ));
  final boredTopCategoryId = boredByCategory.entries.sorted((a, b) => b.value.compareTo(a.value)).firstOrNull?.key;
  final boredTopCategory = boredTopCategoryId != null ? categoryMap[boredTopCategoryId]?.name : null;

  final effortLeaderboard = currentMonthExpenses.groupListsBy((tx) => tx.categoryId).entries.map((entry) {
    final hours = entry.value.fold<double>(0.0, (sum, tx) => sum + tx.effortHours);
    final category = categoryMap[entry.key];
    return EffortInsight(
      categoryId: entry.key,
      categoryName: category?.name ?? 'Kategori',
      hours: hours,
    );
  }).toList()
    ..sort((a, b) => b.hours.compareTo(a.hours));

  final discretionaryMoods = {Mood.bored, Mood.veryHappy, Mood.happy};
  final discretionaryWasteHours = currentMonthExpenses
      .where((tx) => discretionaryMoods.contains(tx.mood))
      .fold<double>(0.0, (sum, tx) => sum + tx.effortHours);

  final monthlyEffortHours = currentMonthExpenses.fold<double>(0.0, (sum, tx) => sum + tx.effortHours);

  final Map<String, double> categoryDistribution =
      currentMonthExpenses.groupListsBy((tx) => tx.categoryId).map((key, value) {
    final categoryName = categoryMap[key]?.name ?? 'Kategori';
    final total = value.fold<double>(0.0, (sum, tx) => sum + tx.amount);
    return MapEntry<String, double>(categoryName, total);
  });

  const totalMonths = 60; // keep up to 5 years of monthly data for the range selector.
  final trendFormatter = DateFormat('MMM yy');
  final monthlyBuckets = <String, _MonthlyAggregate>{};
  for (final tx in txList) {
    final period = DateTime(tx.date.year, tx.date.month);
    final key = '${period.year}-${period.month}';
    final bucket = monthlyBuckets.putIfAbsent(key, () => _MonthlyAggregate(period));
    if (tx.isIncome) {
      bucket.income += tx.amount;
    } else {
      bucket.expense += tx.amount;
    }
  }

  final monthlyTrend = <MonthlyTrendPoint>[];
  for (var i = totalMonths - 1; i >= 0; i--) {
    final date = DateTime(now.year, now.month - i, 1);
    final key = '${date.year}-${date.month}';
    final bucket = monthlyBuckets[key];
    monthlyTrend.add(
      MonthlyTrendPoint(
        period: date,
        label: trendFormatter.format(date),
        income: bucket?.income ?? 0,
        expense: bucket?.expense ?? 0,
      ),
    );
  }

  return AsyncData(
    AnalysisSummary(
      emotionInsights: emotionInsights,
      stressedSpending: stressedSpending,
      boredTopCategory: boredTopCategory,
      topEffortCategories: effortLeaderboard.take(5).toList(),
      discretionaryWasteHours: discretionaryWasteHours,
      monthlyEffortHours: monthlyEffortHours,
      categoryDistribution: categoryDistribution,
      monthlyTrend: monthlyTrend,
    ),
  );
});

class _MonthlyAggregate {
  _MonthlyAggregate(this.period);

  final DateTime period;
  double income = 0;
  double expense = 0;
}

