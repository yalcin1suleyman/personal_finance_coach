import 'package:hive/hive.dart';

part 'recurrence_frequency.g.dart';

@HiveType(typeId: 14)
enum RecurrenceFrequency {
  @HiveField(0)
  daily,
  @HiveField(1)
  weekly,
  @HiveField(2)
  monthly,
  @HiveField(3)
  yearly,
}

extension RecurrenceFrequencyX on RecurrenceFrequency {
  String get label {
    switch (this) {
      case RecurrenceFrequency.daily:
        return 'Günlük';
      case RecurrenceFrequency.weekly:
        return 'Haftalık';
      case RecurrenceFrequency.monthly:
        return 'Aylık';
      case RecurrenceFrequency.yearly:
        return 'Yıllık';
    }
  }
}






