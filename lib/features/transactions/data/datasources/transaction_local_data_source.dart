import 'dart:async';

import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';

class TransactionLocalDataSource {
  TransactionLocalDataSource() : _box = Hive.box<FinanceTransaction>(AppConstants.hiveTransactionsBox);

  final Box<FinanceTransaction> _box;

  Stream<List<FinanceTransaction>> watchTransactions() {
    return Stream<List<FinanceTransaction>>.multi((controller) {
      void emitTransactions() => controller.add(_sortedTransactions());

      emitTransactions();
      final subscription = _box.watch().listen((_) => emitTransactions());
      controller.onCancel = subscription.cancel;
    });
  }

  Future<List<FinanceTransaction>> getTransactions() async => _sortedTransactions();

  FinanceTransaction? getByIdSync(String id) => _box.get(id);

  Future<void> upsert(FinanceTransaction transaction) => _box.put(transaction.id, transaction);

  Future<void> delete(String id) => _box.delete(id);

  List<FinanceTransaction> _sortedTransactions() {
    final list = _box.values.toList()
      ..sort((a, b) => b.date.compareTo(a.date));
    return list;
  }

  Future<void> dispose() async {
    // No-op.
  }
}



