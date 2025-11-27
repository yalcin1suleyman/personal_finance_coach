import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';

part 'home_summary.freezed.dart';

@freezed
class HomeSummary with _$HomeSummary {
  const factory HomeSummary({
    required double totalIncome,
    required double totalExpense,
    required double netBalance,
    required double totalEffortHours,
    required List<Account> accounts,
    required List<FinanceTransaction> recentTransactions,
    required Map<String, double> categoryDistribution,
    required String currencyCode,
  }) = _HomeSummary;

  factory HomeSummary.empty() => HomeSummary(
        totalIncome: 0,
        totalExpense: 0,
        netBalance: 0,
        totalEffortHours: 0,
        accounts: const [],
        recentTransactions: const [],
        categoryDistribution: const {},
        currencyCode: 'TRY',
      );
}






