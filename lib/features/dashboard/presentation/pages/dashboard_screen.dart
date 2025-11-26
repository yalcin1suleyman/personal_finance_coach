import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/core/utils/currency_formatter.dart';
import 'package:personal_finance_coach/features/dashboard/domain/models/dashboard_summary.dart';
import 'package:personal_finance_coach/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:personal_finance_coach/features/transactions/presentation/widgets/transaction_tile.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dashboardSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.insights_outlined),
            onPressed: () => context.go('/analysis'),
          ),
        ],
      ),
      body: _DashboardBody(summary: summary),
    );
  }
}

class _MonthlyOverview extends StatelessWidget {
  const _MonthlyOverview({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyFormatter(summary.currencyCode);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Bu Ay', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _StatItem(label: 'Gelir', value: formatter.format(summary.totalIncome), color: Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _StatItem(label: 'Gider', value: formatter.format(summary.totalExpense), color: Colors.red)),
              ],
            ),
            const SizedBox(height: 12),
            _StatItem(label: 'Net Bakiye', value: formatter.format(summary.netBalance), color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 12),
            Text('Toplam Efor: ${summary.totalEffortHours.toStringAsFixed(1)} saat', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.label, required this.value, required this.color});

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _AccountsSection extends StatelessWidget {
  const _AccountsSection({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyFormatter(summary.currencyCode);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Hesaplar', style: Theme.of(context).textTheme.titleLarge),
            TextButton(
              onPressed: () => context.push('/accounts'),
              child: const Text('Yönet'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: summary.accounts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final account = summary.accounts[index];
              return Container(
                width: 180,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(account.name, style: Theme.of(context).textTheme.titleMedium),
                    Text(formatter.format(account.balance), style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () => context.push('/transactions/new?type=income'),
            icon: const Icon(Icons.arrow_downward_rounded),
            label: const Text('Gelir Ekle'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => context.push('/transactions/new?type=expense'),
            icon: const Icon(Icons.arrow_upward_rounded),
            label: const Text('Gider Ekle'),
          ),
        ),
      ],
    );
  }
}

class _RecentTransactions extends StatelessWidget {
  const _RecentTransactions({required this.summary});

  final DashboardSummary summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Son İşlemler', style: Theme.of(context).textTheme.titleLarge),
            TextButton(
              onPressed: () => context.push('/analysis'),
              child: const Text('Analiz'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (summary.recentTransactions.isEmpty)
          const Text('Henüz işlem yok', style: TextStyle(color: Colors.grey))
        else
          ...summary.recentTransactions.map(
            (transaction) => TransactionTile(
              transaction: transaction,
              currencyCode: summary.currencyCode,
              onTap: () => context.push('/transactions/${transaction.id}'),
            ),
          ),
      ],
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({required this.summary});

  final DashboardSummary summary;

  bool get _showEmptyState =>
      summary.recentTransactions.isEmpty &&
      summary.totalIncome == 0 &&
      summary.totalExpense == 0 &&
      summary.accounts.isEmpty;

  @override
  Widget build(BuildContext context) {
    if (_showEmptyState) {
      debugPrint('[DashboardScreen] Showing empty state');
      return _EmptyDashboardState(
        onAddTransaction: () => context.push('/transactions/new'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 200));
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _MonthlyOverview(summary: summary),
          const SizedBox(height: 16),
          _AccountsSection(summary: summary),
          const SizedBox(height: 16),
          _QuickActions(),
          const SizedBox(height: 16),
          _RecentTransactions(summary: summary),
        ],
      ),
    );
  }
}

class _EmptyDashboardState extends StatelessWidget {
  const _EmptyDashboardState({required this.onAddTransaction});

  final VoidCallback onAddTransaction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text('Henüz işlem yok', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(
              'İlk işlemini ekleyerek kişisel finans koçunu çalıştırmaya başla.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onAddTransaction,
              icon: const Icon(Icons.add),
              label: const Text('İlk işlemini ekle'),
            ),
          ],
        ),
      ),
    );
  }
}

