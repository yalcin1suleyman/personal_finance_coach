import 'dart:async';

import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/core/enums/account_type.dart';
import 'package:personal_finance_coach/features/accounts/domain/entities/account.dart';

class AccountLocalDataSource {
  AccountLocalDataSource() : _box = Hive.box<Account>(AppConstants.hiveAccountsBox) {
    if (_box.isEmpty) {
      _seedDefaults();
    }
  }

  final Box<Account> _box;

  Stream<List<Account>> watchAccounts() {
    return Stream<List<Account>>.multi((controller) {
      void emitSnapshot() => controller.add(_box.values.toList());

      emitSnapshot();
      final subscription = _box.watch().listen((_) => emitSnapshot());
      controller.onCancel = subscription.cancel;
    });
  }

  Future<List<Account>> getAccounts() async => _box.values.toList();

  Future<void> upsert(Account account) => _box.put(account.id, account);

  Future<void> delete(String id) => _box.delete(id);

  Future<void> dispose() async {
    // No-op: stream subscriptions are tied to individual listeners.
  }

  void _seedDefaults() {
    final now = DateTime.now();
    final cashAccount = Account(
      id: 'cash',
      name: 'Cüzdan',
      type: AccountType.cash,
      icon: '💸',
      balance: 0,
      createdAt: now,
    );
    _box.put(cashAccount.id, cashAccount);
  }
}

