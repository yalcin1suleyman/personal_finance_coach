import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';
import 'package:personal_finance_coach/core/extensions/date_extensions.dart';
import 'package:personal_finance_coach/core/utils/currency_formatter.dart';
import 'package:personal_finance_coach/features/profile/presentation/providers/profile_providers.dart';
import 'package:personal_finance_coach/features/transactions/presentation/providers/transaction_providers.dart';

class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({super.key, required this.transactionId});

  final String transactionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(transactionsStreamProvider);
    final profile = ref.watch(profileStreamProvider);

    if (transactions.isLoading || profile.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final tx = transactions.value?.firstWhereOrNull((element) => element.id == transactionId);
    final profileData = profile.value;
    if (tx == null || profileData == null) {
      return const Scaffold(body: Center(child: Text('İşlem bulunamadı')));
    }
    final formatter = CurrencyFormatter(profileData.currencyCode);

    return Scaffold(
      appBar: AppBar(title: Text(tx.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formatter.format(tx.amount),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: tx.isIncome ? Colors.green : Colors.red,
                  ),
            ),
            const SizedBox(height: 8),
            Text('${tx.date.dayMonthYear} • ${tx.mood.label}'),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Açıklama', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(tx.description ?? '—'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Efor Analizi', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('≈ ${tx.effortHours.toStringAsFixed(2)} saat'),
                    Text('≈ ${tx.focusBlocks.toStringAsFixed(0)} odak bloğu'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Text('Pişmanlık bildirimi', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => ref.read(transactionControllerProvider).markRegret(tx.id, false),
                    child: const Text('Hayır'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton(
                    onPressed: () => ref.read(transactionControllerProvider).markRegret(tx.id, true),
                    child: const Text('Evet, pişmanım'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

