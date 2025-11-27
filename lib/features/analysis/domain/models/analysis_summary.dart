import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:personal_finance_coach/core/enums/mood.dart';

part 'analysis_summary.freezed.dart';

@freezed
class EmotionInsight with _$EmotionInsight {
  const factory EmotionInsight({
    required Mood mood,
    required double amount,
    required double regretRatio,
  }) = _EmotionInsight;
}

@freezed
class EffortInsight with _$EffortInsight {
  const factory EffortInsight({
    required String categoryId,
    required String categoryName,
    required double hours,
  }) = _EffortInsight;
}

@freezed
class MonthlyTrendPoint with _$MonthlyTrendPoint {
  const factory MonthlyTrendPoint({
    required DateTime period,
    required String label,
    required double income,
    required double expense,
  }) = _MonthlyTrendPoint;
}

@freezed
class AnalysisSummary with _$AnalysisSummary {
  const factory AnalysisSummary({
    required List<EmotionInsight> emotionInsights,
    required double stressedSpending,
    required String? boredTopCategory,
    required List<EffortInsight> topEffortCategories,
    required double discretionaryWasteHours,
    required double monthlyEffortHours,
    required Map<String, double> categoryDistribution,
    required List<MonthlyTrendPoint> monthlyTrend,
  }) = _AnalysisSummary;

  factory AnalysisSummary.empty() => AnalysisSummary(
        emotionInsights: const [],
        stressedSpending: 0,
        boredTopCategory: null,
        topEffortCategories: const [],
        discretionaryWasteHours: 0,
        monthlyEffortHours: 0,
        categoryDistribution: const {},
        monthlyTrend: const [],
      );
}






