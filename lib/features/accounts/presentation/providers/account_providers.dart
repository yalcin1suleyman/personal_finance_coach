import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/providers/app_providers.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';
import 'package:personal_finance_coach/features/accounts/domain/repositories/account_repository.dart';

final accountsStreamProvider = StreamProvider<List<Account>>((ref) {
  var loggedFirstEmission = false;
  return ref.watch(accountRepositoryProvider).watchAccounts().map((accounts) {
    if (!loggedFirstEmission) {
      debugPrint('[AccountsStreamProvider] First value emitted (count=${accounts.length})');
      loggedFirstEmission = true;
    }
    return accounts;
  });
});

final accountControllerProvider = Provider<AccountController>((ref) {
  return AccountController(ref.watch(accountRepositoryProvider));
});

class AccountController {
  AccountController(this._repository);

  final AccountRepository _repository;

  Future<void> save(Account account) => _repository.saveAccount(account);

  Future<void> delete(String id) => _repository.deleteAccount(id);
}




