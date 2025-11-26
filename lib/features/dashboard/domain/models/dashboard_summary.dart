import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';

part 'dashboard_summary.freezed.dart';

@freezed
class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required double totalIncome,
    required double totalExpense,
    required double netBalance,
    required double totalEffortHours,
    required List<Account> accounts,
    required List<FinanceTransaction> recentTransactions,
    required String currencyCode,
  }) = _DashboardSummary;

  factory DashboardSummary.empty() => DashboardSummary(
        totalIncome: 0,
        totalExpense: 0,
        netBalance: 0,
        totalEffortHours: 0,
        accounts: const [],
        recentTransactions: const [],
        currencyCode: 'TRY',
      );
}





