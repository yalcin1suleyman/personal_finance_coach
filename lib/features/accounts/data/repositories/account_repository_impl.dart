import 'package:personal_finance_coach/features/accounts/data/datasources/account_local_data_source.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/accounts/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  AccountRepositoryImpl(this._localDataSource);

  final AccountLocalDataSource _localDataSource;

  @override
  Future<void> deleteAccount(String id) => _localDataSource.delete(id);

  @override
  Future<List<Account>> getAccounts() => _localDataSource.getAccounts();

  @override
  Future<void> saveAccount(Account account) => _localDataSource.upsert(account);

  @override
  Stream<List<Account>> watchAccounts() => _localDataSource.watchAccounts();
}






