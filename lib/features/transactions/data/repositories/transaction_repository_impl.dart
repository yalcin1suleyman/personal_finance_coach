import 'package:flutter/foundation.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/core/services/notification_service.dart';
import 'package:personal_finance_coach/features/transactions/data/datasources/transaction_local_data_source.dart';
import 'package:personal_finance_coach/features/transactions/domain/entities/finance_transaction.dart';
import 'package:personal_finance_coach/features/transactions/domain/repositories/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl(this._localDataSource, this._notificationService);

  final TransactionLocalDataSource _localDataSource;
  final NotificationService _notificationService;

  @override
  Future<void> deleteTransaction(String id) async {
    await _localDataSource.delete(id);
    await _notificationService.cancelReminder(id);
  }

  @override
  FinanceTransaction? getById(String id) => _localDataSource.getByIdSync(id);

  @override
  Future<List<FinanceTransaction>> getTransactions() => _localDataSource.getTransactions();

  @override
  Future<void> saveTransaction(FinanceTransaction transaction) async {
    await _localDataSource.upsert(transaction);
    if (!transaction.isIncome && transaction.regretAskedAt == null) {
      final remindAt = transaction.date.add(AppConstants.regretReminderDelay);
      if (remindAt.isAfter(DateTime.now())) {
        try {
          await _notificationService.scheduleRegretReminder(
            transactionId: transaction.id,
            title: 'Dünkü ${transaction.title} harcaması',
            body: 'Pişman mısın? Gider detayına gidip işaretle.',
            remindAt: remindAt,
          );
        } catch (error, stackTrace) {
          debugPrint('[TransactionRepository] Reminder scheduling failed: $error');
          debugPrint('$stackTrace');
        }
      }
    } else {
      try {
        await _notificationService.cancelReminder(transaction.id);
      } catch (error, stackTrace) {
        debugPrint('[TransactionRepository] Reminder cancellation failed: $error');
        debugPrint('$stackTrace');
      }
    }
  }

  @override
  Stream<List<FinanceTransaction>> watchTransactions() => _localDataSource.watchTransactions();
}

