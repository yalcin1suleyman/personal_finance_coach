import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/date_extensions.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../categories/presentation/providers/category_providers.dart';
import '../../../profile/presentation/providers/profile_providers.dart';
import '../../domain/entities/finance_transaction.dart';
import '../providers/transaction_providers.dart';

class TransactionsScreen extends ConsumerWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsStreamProvider);
    final categoriesAsync = ref.watch(categoriesStreamProvider);
    final profileAsync = ref.watch(profileStreamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('İşlemler')),
      body: transactionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('İşlemler yüklenemedi: $error')),
        data: (transactions) {
          final sorted = [...transactions]..sort((a, b) => b.date.compareTo(a.date));
          final categoryMap = {
            for (final category in categoriesAsync.value ?? []) category.id: category.name,
          };
          final currencyCode = profileAsync.valueOrNull?.currencyCode ?? 'TRY';
          return RefreshIndicator(
            onRefresh: () async => Future<void>.delayed(const Duration(milliseconds: 150)),
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sorted.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final transaction = sorted[index];
                final categoryName = categoryMap[transaction.categoryId] ?? 'Kategori';
                return _TransactionRow(
                  transaction: transaction,
                  categoryName: categoryName,
                  currencyCode: currencyCode,
                  onTap: () => context.push('/transactions/${transaction.id}'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  const _TransactionRow({
    required this.transaction,
    required this.categoryName,
    required this.currencyCode,
    required this.onTap,
  });

  final FinanceTransaction transaction;
  final String categoryName;
  final String currencyCode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyFormatter(currencyCode);
    final amountPrefix = transaction.isIncome ? '+' : '-';
    final amountColor = transaction.isIncome ? Colors.green : Colors.red;

    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(transaction.title),
        subtitle: Text('$categoryName • ${transaction.date.shortDayMonth}'),
        trailing: Text(
          '$amountPrefix${formatter.format(transaction.amount)}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: amountColor),
        ),
      ),
    );
  }
}

