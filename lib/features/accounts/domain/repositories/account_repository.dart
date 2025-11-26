import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';

abstract class AccountRepository {
  Stream<List<Account>> watchAccounts();
  Future<List<Account>> getAccounts();
  Future<void> saveAccount(Account account);
  Future<void> deleteAccount(String id);
}





