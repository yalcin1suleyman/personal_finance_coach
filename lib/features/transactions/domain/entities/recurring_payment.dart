import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/enums/recurrence_frequency.dart';

part 'recurring_payment.freezed.dart';
part 'recurring_payment.g.dart';

@freezed
@HiveType(typeId: 5)
class RecurringPayment with _$RecurringPayment {
  const factory RecurringPayment({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @HiveField(2) required double amount,
    @HiveField(3) required RecurrenceFrequency frequency,
    @HiveField(4) required DateTime nextPaymentDate,
    @HiveField(5) required bool isIncome,
    @HiveField(6) String? accountId,
    @HiveField(7) String? categoryId,
  }) = _RecurringPayment;

  const RecurringPayment._();

  factory RecurringPayment.fromJson(Map<String, dynamic> json) => _$RecurringPaymentFromJson(json);

  DateTime computeNextDate() {
    switch (frequency) {
      case RecurrenceFrequency.daily:
        return nextPaymentDate.add(const Duration(days: 1));
      case RecurrenceFrequency.weekly:
        return nextPaymentDate.add(const Duration(days: 7));
      case RecurrenceFrequency.monthly:
        return DateTime(nextPaymentDate.year, nextPaymentDate.month + 1, nextPaymentDate.day);
      case RecurrenceFrequency.yearly:
        return DateTime(nextPaymentDate.year + 1, nextPaymentDate.month, nextPaymentDate.day);
    }
  }
}





