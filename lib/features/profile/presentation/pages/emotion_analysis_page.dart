import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enums/mood.dart';
import '../../../analysis/presentation/providers/analysis_providers.dart';

class EmotionAnalysisPage extends ConsumerWidget {
  const EmotionAnalysisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(analysisSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Duygu Analizi')),
      body: summaryAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Veri alınamadı: $error')),
        data: (summary) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Harcama Duyguları', style: Theme.of(context).textTheme.titleLarge),
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
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_fire_department_outlined),
                title: const Text('Stresliyken yapılan harcama'),
                subtitle: Text('₺${summary.stressedSpending.toStringAsFixed(0)}'),
              ),
            ),
            if (summary.boredTopCategory != null)
              Card(
                child: ListTile(
                  leading: const Icon(Icons.sentiment_dissatisfied_outlined),
                  title: const Text('Sıkılınca en çok harcanan kategori'),
                  subtitle: Text(summary.boredTopCategory!),
                ),
              ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.timer_outlined),
                title: const Text('Keyfi harcamaların zaman kaybı'),
                subtitle: Text('${summary.discretionaryWasteHours.toStringAsFixed(1)} saat'),
              ),
            ),
          ],
        ),
      ),
    );
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

