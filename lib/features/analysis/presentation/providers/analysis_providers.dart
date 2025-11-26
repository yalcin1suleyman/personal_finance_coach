import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';
import 'package:personal_finance_coach/features/analysis/domain/models/analysis_summary.dart';
import 'package:personal_finance_coach/features/categories/presentation/providers/category_providers.dart';
import 'package:personal_finance_coach/features/transactions/presentation/providers/transaction_providers.dart';

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

  final trendFormatter = DateFormat('MMM');
  final lastSixMonths = List.generate(6, (index) {
    final date = DateTime(now.year, now.month - index, 1);
    return DateTime(date.year, date.month);
  }).reversed;
  final monthlyTrend = lastSixMonths.map((date) {
    final monthTx = txList.where((tx) => tx.date.year == date.year && tx.date.month == date.month);
    final income = monthTx.where((tx) => tx.isIncome).fold<double>(0.0, (sum, tx) => sum + tx.amount);
    final expense = monthTx.where((tx) => !tx.isIncome).fold<double>(0.0, (sum, tx) => sum + tx.amount);
    return MonthlyTrendPoint(
      label: trendFormatter.format(date),
      income: income,
      expense: expense,
    );
  }).toList();

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

