import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../accounts/domain/entities/account.dart';
import '../../../accounts/presentation/providers/account_providers.dart';
import '../../../categories/domain/entities/category.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../../../profile/domain/entities/user_profile.dart';
import '../../../profile/presentation/providers/profile_providers.dart';
import '../../../transactions/domain/entities/finance_transaction.dart';
import '../../../transactions/presentation/providers/transaction_providers.dart';
import '../../domain/models/home_summary.dart';

/// Aggregates the old dashboard data into the new home feature for clearer separation.
final homeSummaryProvider = Provider<HomeSummary>((ref) {
  final profileAsync = ref.watch(profileStreamProvider);
  final accountsAsync = ref.watch(accountsStreamProvider);
  final categoriesAsync = ref.watch(categoriesStreamProvider);
  final transactionsAsync = ref.watch(transactionsStreamProvider);

  _logAsyncValueState('profile', profileAsync);
  _logAsyncValueState('accounts', accountsAsync);
  _logAsyncValueState('categories', categoriesAsync);
  _logAsyncValueState('transactions', transactionsAsync);

  final profile = profileAsync.valueOrNull ?? UserProfile.empty();
  final accountList = accountsAsync.value ?? const <Account>[];
  final transactionList = transactionsAsync.value ?? const <FinanceTransaction>[];
  final sortedTransactions = [...transactionList]..sort((a, b) => b.date.compareTo(a.date));
  final categoryList = categoriesAsync.value ?? const <FinanceCategory>[];

  final now = DateTime.now();
  final currentMonth = transactionList.where((tx) => tx.date.year == now.year && tx.date.month == now.month);
  final currentMonthExpenses = currentMonth.where((tx) => !tx.isIncome);

  final totalIncome = currentMonth.where((tx) => tx.isIncome).fold<double>(0, (sum, tx) => sum + tx.amount);
  final totalExpense = currentMonthExpenses.fold<double>(0, (sum, tx) => sum + tx.amount);
  final totalEffort = currentMonthExpenses.fold<double>(0, (sum, tx) => sum + tx.effortHours);

  final categoryNameMap = {for (final category in categoryList) category.id: category.name};
  final categoryDistribution = <String, double>{};
  for (final tx in currentMonthExpenses) {
    final categoryName = categoryNameMap[tx.categoryId] ?? 'Diğer';
    categoryDistribution[categoryName] = (categoryDistribution[categoryName] ?? 0) + tx.amount;
  }

  final summary = HomeSummary(
    totalIncome: totalIncome,
    totalExpense: totalExpense,
    netBalance: totalIncome - totalExpense,
    totalEffortHours: totalEffort,
    accounts: accountList,
    recentTransactions: sortedTransactions.take(5).toList(),
    categoryDistribution: categoryDistribution,
    currencyCode: profile.currencyCode,
  );

  debugPrint(
    '[HomeSummaryProvider] Built summary: accounts=${accountList.length}, '
    'transactions=${transactionList.length}, netBalance=${summary.netBalance}',
  );

  return summary;
});

void _logAsyncValueState(String label, AsyncValue<dynamic> value) {
  debugPrint(
    '[HomeSummaryProvider] $label -> '
    'loading=${value.isLoading} hasValue=${value.hasValue} hasError=${value.hasError}',
  );
  if (value.hasError) {
    debugPrint('[HomeSummaryProvider] $label error: ${value.error}');
  }
}

