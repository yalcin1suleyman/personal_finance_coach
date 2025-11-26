import 'package:intl/intl.dart';

extension DateFormattingX on DateTime {
  String get shortDayMonth => DateFormat('d MMM').format(this);
  String get dayMonthYear => DateFormat('d MMM yyyy').format(this);
  String get hourMinute => DateFormat('HH:mm').format(this);

  DateTime get dateOnly => DateTime(year, month, day);
}




