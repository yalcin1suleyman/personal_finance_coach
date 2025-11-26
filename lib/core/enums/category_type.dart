import 'package:hive/hive.dart';

part 'category_type.g.dart';

@HiveType(typeId: 12)
enum CategoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

extension CategoryTypeX on CategoryType {
  String get label => this == CategoryType.income ? 'Gelir' : 'Gider';

  bool get isIncome => this == CategoryType.income;
  bool get isExpense => this == CategoryType.expense;
}

