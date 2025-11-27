import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/enums/account_type.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
@HiveType(typeId: 2)
class Account with _$Account {
  const factory Account({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required AccountType type,
    @HiveField(3) required String icon,
    @HiveField(4) required double balance,
    @HiveField(5) required DateTime createdAt,
  }) = _Account;

  const Account._();

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}






