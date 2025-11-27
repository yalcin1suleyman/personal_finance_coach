import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../transactions/presentation/widgets/transaction_tile.dart';
import '../../domain/models/home_summary.dart';
import '../providers/home_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(homeSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics_outlined),
            onPressed: () => context.go('/analysis'),
          ),
        ],
      ),
      body: _HomeBody(summary: summary),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.summary});

  final HomeSummary summary;

  bool get _showEmptyState =>
      summary.recentTransactions.isEmpty &&
      summary.totalIncome == 0 &&
      summary.totalExpense == 0 &&
      summary.accounts.isEmpty;

  @override
  Widget build(BuildContext context) {
    if (_showEmptyState) {
      debugPrint('[HomeScreen] Showing empty state');
      return _EmptyHomeState(
        onAddTransaction: () => context.push('/transactions/new'),
      );
    }

    return RefreshIndicator(
      onRefresh: () async => Future<void>.delayed(const Duration(milliseconds: 150)),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _MonthlyOverview(summary: summary),
            const SizedBox(height: 16),
            _AccountsSection(summary: summary),
            const SizedBox(height: 16),
            const _QuickActions(),
            const SizedBox(height: 16),
            _RecentTransactions(summary: summary),
          ],
        ),
      ),
    );
  }
}

class _MonthlyOverview extends StatelessWidget {
  const _MonthlyOverview({required this.summary});

  final HomeSummary summary;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyFormatter(summary.currencyCode);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Bu Ayın Özeti', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 600;
                final stats = _StatGrid(summary: summary, formatter: formatter);
                final chart = _CategoryDonut(summary: summary, formatter: formatter);
                if (isNarrow) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      stats,
                      const SizedBox(height: 20),
                      chart,
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: stats),
                    const SizedBox(width: 24),
                    SizedBox(width: 220, child: chart),
                  ],
                );
              },
            ),
            if (summary.categoryDistribution.isNotEmpty) ...[
              const SizedBox(height: 16),
              _CategoryLegend(
                distribution: summary.categoryDistribution,
                formatter: formatter,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  const _StatGrid({required this.summary, required this.formatter});

  final HomeSummary summary;
  final CurrencyFormatter formatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatItem(label: 'Toplam Gelir', value: formatter.format(summary.totalIncome), color: Colors.green),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatItem(label: 'Toplam Gider', value: formatter.format(summary.totalExpense), color: Colors.red),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _StatItem(
                label: 'Net Bakiye',
                value: formatter.format(summary.netBalance),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _StatItem(
                label: 'Toplam Efor',
                value: '${summary.totalEffortHours.toStringAsFixed(1)} saat',
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ],
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

class _CategoryDonut extends StatelessWidget {
  const _CategoryDonut({required this.summary, required this.formatter});

  final HomeSummary summary;
  final CurrencyFormatter formatter;

  @override
  Widget build(BuildContext context) {
    if (summary.categoryDistribution.isEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 12),
          Text('Bu ay için gider dağılımı yok', textAlign: TextAlign.center),
        ],
      );
    }

    final entries = summary.categoryDistribution.entries.toList();
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: -90,
              sectionsSpace: 2,
              centerSpaceRadius: 60,
              sections: [
                for (int i = 0; i < entries.length; i++)
                  PieChartSectionData(
                    color: Colors.primaries[i % Colors.primaries.length],
                    value: entries[i].value,
                    title: '',
                    radius: 80,
                  ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                formatter.format(summary.totalExpense),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Toplam Gider',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryLegend extends StatelessWidget {
  const _CategoryLegend({required this.distribution, required this.formatter});

  final Map<String, double> distribution;
  final CurrencyFormatter formatter;

  @override
  Widget build(BuildContext context) {
    final entries = distribution.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: [
        for (int i = 0; i < entries.length; i++)
          Chip(
            label: Text('${entries[i].key} • ${formatter.format(entries[i].value)}'),
            backgroundColor: Colors.primaries[i % Colors.primaries.length].withValues(alpha: 0.12),
          ),
      ],
    );
  }
}

class _AccountsSection extends StatelessWidget {
  const _AccountsSection({required this.summary});

  final HomeSummary summary;

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
          height: 130,
          child: summary.accounts.isEmpty
              ? const Center(child: Text('Henüz hesap eklenmedi'))
              : ListView.separated(
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
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () => context.push('/transactions/new?type=income'),
            icon: const Icon(Icons.south_west_rounded),
            label: const Text('Gelir Ekle'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => context.push('/transactions/new?type=expense'),
            icon: const Icon(Icons.north_east_rounded),
            label: const Text('Gider Ekle'),
          ),
        ),
      ],
    );
  }
}

class _RecentTransactions extends StatelessWidget {
  const _RecentTransactions({required this.summary});

  final HomeSummary summary;

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
              onPressed: () => context.go('/transactions'),
              child: const Text('Tümü'),
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

class _EmptyHomeState extends StatelessWidget {
  const _EmptyHomeState({required this.onAddTransaction});

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

