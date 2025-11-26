import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/services/notification_service.dart';
import 'package:personal_finance_coach/features/accounts/data/datasources/account_local_data_source.dart';
import 'package:personal_finance_coach/features/accounts/data/repositories/account_repository_impl.dart';
import 'package:personal_finance_coach/features/accounts/domain/repositories/account_repository.dart';
import 'package:personal_finance_coach/features/categories/data/datasources/category_local_data_source.dart';
import 'package:personal_finance_coach/features/categories/data/repositories/category_repository_impl.dart';
import 'package:personal_finance_coach/features/categories/domain/repositories/category_repository.dart';
import 'package:personal_finance_coach/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:personal_finance_coach/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:personal_finance_coach/features/profile/domain/repositories/profile_repository.dart';
import 'package:personal_finance_coach/features/transactions/data/datasources/transaction_local_data_source.dart';
import 'package:personal_finance_coach/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:personal_finance_coach/features/transactions/domain/repositories/transaction_repository.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

final profileLocalDataSourceProvider = Provider<ProfileLocalDataSource>((ref) {
  final dataSource = ProfileLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepositoryImpl(ref.watch(profileLocalDataSourceProvider));
});

final accountLocalDataSourceProvider = Provider<AccountLocalDataSource>((ref) {
  final dataSource = AccountLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepositoryImpl(ref.watch(accountLocalDataSourceProvider));
});

final categoryLocalDataSourceProvider = Provider<CategoryLocalDataSource>((ref) {
  final dataSource = CategoryLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl(ref.watch(categoryLocalDataSourceProvider));
});

final transactionLocalDataSourceProvider = Provider<TransactionLocalDataSource>((ref) {
  final dataSource = TransactionLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepositoryImpl(
    ref.watch(transactionLocalDataSourceProvider),
    ref.watch(notificationServiceProvider),
  );
});





