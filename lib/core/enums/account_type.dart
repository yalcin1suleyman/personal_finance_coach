import 'package:hive/hive.dart';

part 'account_type.g.dart';

@HiveType(typeId: 13)
enum AccountType {
  @HiveField(0)
  cash,
  @HiveField(1)
  bank,
  @HiveField(2)
  card,
  @HiveField(3)
  investment,
}

extension AccountTypeX on AccountType {
  String get label {
    switch (this) {
      case AccountType.cash:
        return 'Nakit';
      case AccountType.bank:
        return 'Banka';
      case AccountType.card:
        return 'Kart';
      case AccountType.investment:
        return 'Yatırım';
    }
  }
}

