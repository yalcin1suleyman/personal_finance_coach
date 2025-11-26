import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/accounts/presentation/providers/account_providers.dart';
import 'package:personal_finance_coach/features/dashboard/domain/models/dashboard_summary.dart';
import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';
import 'package:personal_finance_coach/features/profile/presentation/providers/profile_providers.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';
import 'package:personal_finance_coach/features/transactions/presentation/providers/transaction_providers.dart';

final dashboardSummaryProvider = Provider<DashboardSummary>((ref) {
  final profileAsync = ref.watch(profileStreamProvider);
  final accountsAsync = ref.watch(accountsStreamProvider);
  final transactionsAsync = ref.watch(transactionsStreamProvider);

  _logAsyncValueState('profile', profileAsync);
  _logAsyncValueState('accounts', accountsAsync);
  _logAsyncValueState('transactions', transactionsAsync);

  final profile = profileAsync.valueOrNull ?? UserProfile.empty();
  final accountList = accountsAsync.value ?? const <Account>[];
  final transactionList = transactionsAsync.value ?? const <FinanceTransaction>[];

  final now = DateTime.now();
  final currentMonth = transactionList.where((tx) => tx.date.year == now.year && tx.date.month == now.month);

  final totalIncome = currentMonth.where((tx) => tx.isIncome).fold<double>(0, (sum, tx) => sum + tx.amount);
  final totalExpense = currentMonth.where((tx) => !tx.isIncome).fold<double>(0, (sum, tx) => sum + tx.amount);
  final totalEffort = currentMonth.where((tx) => !tx.isIncome).fold<double>(0, (sum, tx) => sum + tx.effortHours);

  final summary = DashboardSummary(
    totalIncome: totalIncome,
    totalExpense: totalExpense,
    netBalance: totalIncome - totalExpense,
    totalEffortHours: totalEffort,
    accounts: accountList,
    recentTransactions: transactionList.take(5).toList(),
    currencyCode: profile.currencyCode,
  );

  debugPrint(
    '[DashboardSummaryProvider] Built summary: accounts=${accountList.length}, '
    'transactions=${transactionList.length}, netBalance=${summary.netBalance}',
  );

  return summary;
});

void _logAsyncValueState(String label, AsyncValue<dynamic> value) {
  debugPrint(
    '[DashboardSummaryProvider] $label -> '
    'loading=${value.isLoading} hasValue=${value.hasValue} hasError=${value.hasError}',
  );
  if (value.hasError) {
    debugPrint('[DashboardSummaryProvider] $label error: ${value.error}');
  }
}

