import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/providers/app_providers.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';
import 'package:personal_finance_coach/features/transactions/domain/repositories/transaction_repository.dart';

final transactionsStreamProvider = StreamProvider<List<FinanceTransaction>>((ref) {
  var loggedFirstEmission = false;
  return ref.watch(transactionRepositoryProvider).watchTransactions().map((transactions) {
    if (!loggedFirstEmission) {
      debugPrint('[TransactionsStreamProvider] First value emitted (count=${transactions.length})');
      loggedFirstEmission = true;
    }
    return transactions;
  });
});

final transactionControllerProvider = Provider<TransactionController>((ref) {
  return TransactionController(ref.watch(transactionRepositoryProvider));
});

class TransactionController {
  TransactionController(this._repository);

  final TransactionRepository _repository;

  Future<void> addOrUpdate(FinanceTransaction transaction) {
    return _repository.saveTransaction(transaction);
  }

  Future<void> delete(String id) => _repository.deleteTransaction(id);

  Future<void> markRegret(String id, bool regret) async {
    final tx = _repository.getById(id);
    if (tx == null) return;
    await _repository.saveTransaction(
      tx.copyWith(
        regret: regret,
        regretAskedAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }
}




