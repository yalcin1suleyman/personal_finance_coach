import 'dart:math';

import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/enums/mood.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../profile/presentation/providers/profile_providers.dart';
import '../../domain/models/analysis_summary.dart';
import '../providers/analysis_providers.dart';

class AnalysisScreen extends ConsumerStatefulWidget {
  const AnalysisScreen({super.key});

  @override
  ConsumerState<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends ConsumerState<AnalysisScreen> {
  TrendRange _range = TrendRange.m3;

  @override
  Widget build(BuildContext context) {
    final summaryAsync = ref.watch(analysisSummaryProvider);
    final profileCurrency = ref.watch(profileStreamProvider).valueOrNull?.currencyCode ?? 'TRY';

    return Scaffold(
      appBar: AppBar(title: const Text('Analiz')),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Hata: $error')),
        data: (summary) {
          final filteredTrend = _lastMonths(summary.monthlyTrend, _range.months);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _RangeSelector(
                range: _range,
                onChanged: (value) => setState(() => _range = value),
              ),
              const SizedBox(height: 16),
              _DifferenceChart(data: filteredTrend),
              const SizedBox(height: 16),
              _IncomeExpenseChart(data: filteredTrend),
              const SizedBox(height: 24),
              _MoreDetails(
                summary: summary,
                currencyCode: profileCurrency,
              ),
            ],
          );
        },
      ),
    );
  }

  List<MonthlyTrendPoint> _lastMonths(List<MonthlyTrendPoint> data, int months) {
    if (data.isEmpty) return const [];
    final startIndex = max(0, data.length - months);
    return data.sublist(startIndex);
  }
}

enum TrendRange { m1, m3, m6, y1, y3, y5 }

extension TrendRangeX on TrendRange {
  String get label => switch (this) {
        TrendRange.m1 => '1A',
        TrendRange.m3 => '3A',
        TrendRange.m6 => '6A',
        TrendRange.y1 => '1Y',
        TrendRange.y3 => '3Y',
        TrendRange.y5 => '5Y',
      };

  int get months => switch (this) {
        TrendRange.m1 => 1,
        TrendRange.m3 => 3,
        TrendRange.m6 => 6,
        TrendRange.y1 => 12,
        TrendRange.y3 => 36,
        TrendRange.y5 => 60,
      };
}

class _RangeSelector extends StatelessWidget {
  const _RangeSelector({required this.range, required this.onChanged});

  final TrendRange range;
  final ValueChanged<TrendRange> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        for (final option in TrendRange.values)
          ChoiceChip(
            label: Text(option.label),
            selected: option == range,
            onSelected: (_) => onChanged(option),
          ),
      ],
    );
  }
}

class _DifferenceChart extends StatelessWidget {
  const _DifferenceChart({required this.data});

  final List<MonthlyTrendPoint> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const _ChartPlaceholder(message: 'Trend verisi bulunamadı.');
    }

    final differences = data.map((point) => point.income - point.expense).toList();
    final maxDelta = differences.fold<double>(0, (maxValue, value) => max(maxValue, value.abs()));
    final chartMax = (maxDelta == 0 ? 1000 : maxDelta * 1.2).toDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gelir - Gider Farkı', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            SizedBox(
              height: 220,
              child: BarChart(
                BarChartData(
                  minY: -chartMax,
                  maxY: chartMax,
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= data.length) return const SizedBox.shrink();
                          return Text(data[index].label, style: const TextStyle(fontSize: 11));
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: [
                    for (int i = 0; i < data.length; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: differences[i],
                            color: differences[i] >= 0 ? Colors.green : Colors.red,
                            width: 12,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IncomeExpenseChart extends StatelessWidget {
  const _IncomeExpenseChart({required this.data});

  final List<MonthlyTrendPoint> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const _ChartPlaceholder(message: 'Grafik için henüz veri yok.');
    }

    final highest = data.fold<double>(0, (maxValue, point) => max(maxValue, max(point.income, point.expense)));
    final maxY = (highest == 0 ? 1000 : highest * 1.2).toDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gelir & Gider Trendleri', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              child: LineChart(
                LineChartData(
                  minY: 0,
                  maxY: maxY,
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 44),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= data.length) return const SizedBox.shrink();
                          return Text(data[index].label, style: const TextStyle(fontSize: 11));
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      color: Colors.green,
                      isCurved: true,
                      barWidth: 3,
                      spots: [
                        for (int i = 0; i < data.length; i++) FlSpot(i.toDouble(), data[i].income),
                      ],
                    ),
                    LineChartBarData(
                      color: Colors.red,
                      isCurved: true,
                      barWidth: 3,
                      spots: [
                        for (int i = 0; i < data.length; i++) FlSpot(i.toDouble(), data[i].expense),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoreDetails extends StatelessWidget {
  const _MoreDetails({required this.summary, required this.currencyCode});

  final AnalysisSummary summary;
  final String currencyCode;

  @override
  Widget build(BuildContext context) {
    final formatter = CurrencyFormatter(currencyCode);
    final topEmotion = summary.emotionInsights.sorted((a, b) => b.amount.compareTo(a.amount)).firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Detaylar', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        // Legacy emotion widgets moved here so the main screen focuses on time charts.
        Card(
          child: ListTile(
            leading: Icon(topEmotion?.mood.icon ?? Icons.sentiment_satisfied_outlined, color: topEmotion?.mood.color),
            title: const Text('Duygu Analizi'),
            subtitle: Text(
              topEmotion == null
                  ? 'Harcamalarına eşlik eden duyguları incele'
                  : '${topEmotion.mood.label} harcamaları ${formatter.format(topEmotion.amount)}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/profile/emotions'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.local_fire_department_outlined),
            title: const Text('Stres Harcamaları'),
            subtitle: Text('${formatter.format(summary.stressedSpending)} bu ay stresliyken harcandı'),
          ),
        ),
        if (summary.boredTopCategory != null)
          Card(
            child: ListTile(
              leading: const Icon(Icons.sentiment_dissatisfied_outlined),
              title: const Text('Sıkılınca harcanan kategori'),
              subtitle: Text(summary.boredTopCategory!),
            ),
          ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.speed_outlined),
            title: const Text('Toplam Efor'),
            subtitle: Text('${summary.monthlyEffortHours.toStringAsFixed(1)} saat'),
          ),
        ),
        if (summary.topEffortCategories.isNotEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Eforu En Çok Yiyen 3 Kategori', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 12),
                  for (final item in summary.topEffortCategories.take(3))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(item.categoryName)),
                          Text('${item.hours.toStringAsFixed(1)} sa'),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class _ChartPlaceholder extends StatelessWidget {
  const _ChartPlaceholder({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 200,
        child: Center(child: Text(message)),
      ),
    );
  }
}
