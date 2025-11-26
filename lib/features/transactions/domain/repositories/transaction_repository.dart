import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';

abstract class TransactionRepository {
  Stream<List<FinanceTransaction>> watchTransactions();
  Future<List<FinanceTransaction>> getTransactions();
  Future<void> saveTransaction(FinanceTransaction transaction);
  Future<void> deleteTransaction(String id);
  FinanceTransaction? getById(String id);
}





