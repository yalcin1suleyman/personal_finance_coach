import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';

part 'finance_transaction.freezed.dart';
part 'finance_transaction.g.dart';

@freezed
@HiveType(typeId: 4)
class FinanceTransaction with _$FinanceTransaction {
  const factory FinanceTransaction({
    @HiveField(0) required String id,
    @HiveField(1) required bool isIncome,
    @HiveField(2) required double amount,
    @HiveField(3) required String title,
    @HiveField(4) String? description,
    @HiveField(5) required DateTime date,
    @HiveField(6) required String accountId,
    @HiveField(7) required String categoryId,
    @HiveField(8) String? receiptPath,
    @HiveField(9) required Mood mood,
    @HiveField(10) bool? regret,
    @HiveField(11) required double effortHours,
    @HiveField(12) required DateTime createdAt,
    @HiveField(13) required DateTime updatedAt,
    @HiveField(14) DateTime? regretAskedAt,
  }) = _FinanceTransaction;

  const FinanceTransaction._();

  factory FinanceTransaction.fromJson(Map<String, dynamic> json) => _$FinanceTransactionFromJson(json);

  double get focusBlocks => effortHours <= 0 ? 0 : (effortHours * 60) / 25;
}





