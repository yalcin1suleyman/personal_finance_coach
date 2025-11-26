import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';
import 'package:personal_finance_coach/features/analysis/presentation/providers/analysis_providers.dart';

class AnalysisScreen extends ConsumerWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(analysisSummaryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Analiz & Raporlar')),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Hata: $error')),
        data: (summary) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionTitle('Duygu Analizi'),
            const SizedBox(height: 12),
            if (summary.emotionInsights.isEmpty)
              const Text('Bu ay için yeterli veri yok.')
            else
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: summary.emotionInsights
                    .map(
                      (insight) => _MoodCard(
                        mood: insight.mood,
                        amount: insight.amount,
                        regretRatio: insight.regretRatio,
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(height: 24),
            _InfoCard(
              title: 'Stresliyken yapılan harcama',
              value: '₺${summary.stressedSpending.toStringAsFixed(0)}',
            ),
            if (summary.boredTopCategory != null)
              _InfoCard(
                title: 'Sıkılınca en çok harcanan kategori',
                value: summary.boredTopCategory!,
              ),
            const SizedBox(height: 24),
            _SectionTitle('Efor Analizi'),
            const SizedBox(height: 12),
            if (summary.topEffortCategories.isEmpty)
              const Text('Efor analizi için veri bekleniyor.')
            else
              Column(
                children: summary.topEffortCategories
                    .map(
                      (item) => ListTile(
                        leading: const Icon(Icons.watch_later_outlined),
                        title: Text(item.categoryName),
                        trailing: Text('${item.hours.toStringAsFixed(1)} saat'),
                      ),
                    )
                    .toList(),
              ),
            const SizedBox(height: 8),
            _InfoCard(
              title: 'Keyfi harcamaların zaman kaybı',
              value: '${summary.discretionaryWasteHours.toStringAsFixed(1)} saat',
            ),
            _InfoCard(
              title: 'Aylık toplam harcanan emek',
              value: '${summary.monthlyEffortHours.toStringAsFixed(1)} saat',
            ),
            const SizedBox(height: 24),
            _SectionTitle('Kategori Dağılımı'),
            const SizedBox(height: 12),
            SizedBox(
              height: 240,
              child: summary.categoryDistribution.isEmpty
                  ? const Center(child: Text('Henüz gider yok'))
                  : Builder(
                      builder: (context) {
                        final categoryKeys = summary.categoryDistribution.keys.toList();
                        return PieChart(
                      PieChartData(
                        sections: summary.categoryDistribution.entries
                            .map(
                              (entry) {
                                final colorIndex = categoryKeys.indexOf(entry.key) % Colors.primaries.length;
                                return PieChartSectionData(
                                  color: Colors.primaries[colorIndex].withValues(alpha: 0.8),
                                  value: entry.value,
                                  title: entry.key,
                                  radius: 80,
                                );
                              },
                            )
                            .toList(),
                      ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 24),
            _SectionTitle('Aylık Gelir / Gider'),
            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              child: summary.monthlyTrend.isEmpty
                  ? const Center(child: Text('Trend verisi yok'))
                  : LineChart(
                      LineChartData(
                        borderData: FlBorderData(show: false),
                        gridData: const FlGridData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                final index = value.toInt();
                                if (index < 0 || index >= summary.monthlyTrend.length) return const SizedBox.shrink();
                                return Text(summary.monthlyTrend[index].label);
                              },
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            color: Colors.green,
                            spots: [
                              for (int i = 0; i < summary.monthlyTrend.length; i++)
                                FlSpot(i.toDouble(), summary.monthlyTrend[i].income),
                            ],
                          ),
                          LineChartBarData(
                            color: Colors.red,
                            spots: [
                              for (int i = 0; i < summary.monthlyTrend.length; i++)
                                FlSpot(i.toDouble(), summary.monthlyTrend[i].expense),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleLarge);
  }
}

class _MoodCard extends StatelessWidget {
  const _MoodCard({required this.mood, required this.amount, required this.regretRatio});

  final Mood mood;
  final double amount;
  final double regretRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(mood.icon, color: mood.color),
              const SizedBox(height: 8),
              Text(mood.label, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text('₺${amount.toStringAsFixed(0)}'),
              const SizedBox(height: 8),
              LinearProgressIndicator(
                value: regretRatio.clamp(0, 1),
                color: Colors.red,
                backgroundColor: Colors.red.withValues(alpha: 0.2),
              ),
              const SizedBox(height: 4),
              Text('Pişmanlık: ${(regretRatio * 100).toStringAsFixed(0)}%'),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Text(value, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}

