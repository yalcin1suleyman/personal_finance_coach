import 'package:personal_finance_coach/core/enums/category_type.dart';

class AppConstants {
  const AppConstants._();

  static const String appTitle = 'Kişisel Finans Koçu';

  static const String hiveProfileBox = 'user_profile_box';
  static const String hiveAccountsBox = 'accounts_box';
  static const String hiveCategoriesBox = 'categories_box';
  static const String hiveTransactionsBox = 'transactions_box';
  static const String hiveRecurringPaymentsBox = 'recurring_payments_box';

  static const Duration regretReminderDelay = Duration(hours: 24);

  static const List<DefaultCategorySeed> defaultExpenseCategories = [
    DefaultCategorySeed('Yeme İçme', '🍽', CategoryType.expense),
    DefaultCategorySeed('Ulaşım', '🚌', CategoryType.expense),
    DefaultCategorySeed('Eğlence', '🎮', CategoryType.expense),
    DefaultCategorySeed('Alışveriş', '🛍', CategoryType.expense),
    DefaultCategorySeed('Kira', '🏠', CategoryType.expense),
    DefaultCategorySeed('Sağlık', '❤️', CategoryType.expense),
  ];

  static const List<DefaultCategorySeed> defaultIncomeCategories = [
    DefaultCategorySeed('Maaş', '💼', CategoryType.income),
    DefaultCategorySeed('Freelance', '🧑‍💻', CategoryType.income),
    DefaultCategorySeed('Yatırım', '📈', CategoryType.income),
    DefaultCategorySeed('Diğer', '➕', CategoryType.income),
  ];
}

class DefaultCategorySeed {
  final String name;
  final String emoji;
  final CategoryType type;

  const DefaultCategorySeed(this.name, this.emoji, this.type);
}






