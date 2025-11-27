// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmotionInsight {
  Mood get mood => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get regretRatio => throw _privateConstructorUsedError;

  /// Create a copy of EmotionInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionInsightCopyWith<EmotionInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionInsightCopyWith<$Res> {
  factory $EmotionInsightCopyWith(
          EmotionInsight value, $Res Function(EmotionInsight) then) =
      _$EmotionInsightCopyWithImpl<$Res, EmotionInsight>;
  @useResult
  $Res call({Mood mood, double amount, double regretRatio});
}

/// @nodoc
class _$EmotionInsightCopyWithImpl<$Res, $Val extends EmotionInsight>
    implements $EmotionInsightCopyWith<$Res> {
  _$EmotionInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? amount = null,
    Object? regretRatio = null,
  }) {
    return _then(_value.copyWith(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      regretRatio: null == regretRatio
          ? _value.regretRatio
          : regretRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmotionInsightImplCopyWith<$Res>
    implements $EmotionInsightCopyWith<$Res> {
  factory _$$EmotionInsightImplCopyWith(_$EmotionInsightImpl value,
          $Res Function(_$EmotionInsightImpl) then) =
      __$$EmotionInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Mood mood, double amount, double regretRatio});
}

/// @nodoc
class __$$EmotionInsightImplCopyWithImpl<$Res>
    extends _$EmotionInsightCopyWithImpl<$Res, _$EmotionInsightImpl>
    implements _$$EmotionInsightImplCopyWith<$Res> {
  __$$EmotionInsightImplCopyWithImpl(
      _$EmotionInsightImpl _value, $Res Function(_$EmotionInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of EmotionInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? amount = null,
    Object? regretRatio = null,
  }) {
    return _then(_$EmotionInsightImpl(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      regretRatio: null == regretRatio
          ? _value.regretRatio
          : regretRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$EmotionInsightImpl implements _EmotionInsight {
  const _$EmotionInsightImpl(
      {required this.mood, required this.amount, required this.regretRatio});

  @override
  final Mood mood;
  @override
  final double amount;
  @override
  final double regretRatio;

  @override
  String toString() {
    return 'EmotionInsight(mood: $mood, amount: $amount, regretRatio: $regretRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionInsightImpl &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.regretRatio, regretRatio) ||
                other.regretRatio == regretRatio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mood, amount, regretRatio);

  /// Create a copy of EmotionInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionInsightImplCopyWith<_$EmotionInsightImpl> get copyWith =>
      __$$EmotionInsightImplCopyWithImpl<_$EmotionInsightImpl>(
          this, _$identity);
}

abstract class _EmotionInsight implements EmotionInsight {
  const factory _EmotionInsight(
      {required final Mood mood,
      required final double amount,
      required final double regretRatio}) = _$EmotionInsightImpl;

  @override
  Mood get mood;
  @override
  double get amount;
  @override
  double get regretRatio;

  /// Create a copy of EmotionInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionInsightImplCopyWith<_$EmotionInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EffortInsight {
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  double get hours => throw _privateConstructorUsedError;

  /// Create a copy of EffortInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EffortInsightCopyWith<EffortInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EffortInsightCopyWith<$Res> {
  factory $EffortInsightCopyWith(
          EffortInsight value, $Res Function(EffortInsight) then) =
      _$EffortInsightCopyWithImpl<$Res, EffortInsight>;
  @useResult
  $Res call({String categoryId, String categoryName, double hours});
}

/// @nodoc
class _$EffortInsightCopyWithImpl<$Res, $Val extends EffortInsight>
    implements $EffortInsightCopyWith<$Res> {
  _$EffortInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EffortInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? hours = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EffortInsightImplCopyWith<$Res>
    implements $EffortInsightCopyWith<$Res> {
  factory _$$EffortInsightImplCopyWith(
          _$EffortInsightImpl value, $Res Function(_$EffortInsightImpl) then) =
      __$$EffortInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String categoryId, String categoryName, double hours});
}

/// @nodoc
class __$$EffortInsightImplCopyWithImpl<$Res>
    extends _$EffortInsightCopyWithImpl<$Res, _$EffortInsightImpl>
    implements _$$EffortInsightImplCopyWith<$Res> {
  __$$EffortInsightImplCopyWithImpl(
      _$EffortInsightImpl _value, $Res Function(_$EffortInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of EffortInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? hours = null,
  }) {
    return _then(_$EffortInsightImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      hours: null == hours
          ? _value.hours
          : hours // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$EffortInsightImpl implements _EffortInsight {
  const _$EffortInsightImpl(
      {required this.categoryId,
      required this.categoryName,
      required this.hours});

  @override
  final String categoryId;
  @override
  final String categoryName;
  @override
  final double hours;

  @override
  String toString() {
    return 'EffortInsight(categoryId: $categoryId, categoryName: $categoryName, hours: $hours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EffortInsightImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.hours, hours) || other.hours == hours));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId, categoryName, hours);

  /// Create a copy of EffortInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EffortInsightImplCopyWith<_$EffortInsightImpl> get copyWith =>
      __$$EffortInsightImplCopyWithImpl<_$EffortInsightImpl>(this, _$identity);
}

abstract class _EffortInsight implements EffortInsight {
  const factory _EffortInsight(
      {required final String categoryId,
      required final String categoryName,
      required final double hours}) = _$EffortInsightImpl;

  @override
  String get categoryId;
  @override
  String get categoryName;
  @override
  double get hours;

  /// Create a copy of EffortInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EffortInsightImplCopyWith<_$EffortInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthlyTrendPoint {
  DateTime get period => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyTrendPointCopyWith<MonthlyTrendPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyTrendPointCopyWith<$Res> {
  factory $MonthlyTrendPointCopyWith(
          MonthlyTrendPoint value, $Res Function(MonthlyTrendPoint) then) =
      _$MonthlyTrendPointCopyWithImpl<$Res, MonthlyTrendPoint>;
  @useResult
  $Res call({DateTime period, String label, double income, double expense});
}

/// @nodoc
class _$MonthlyTrendPointCopyWithImpl<$Res, $Val extends MonthlyTrendPoint>
    implements $MonthlyTrendPointCopyWith<$Res> {
  _$MonthlyTrendPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? label = null,
    Object? income = null,
    Object? expense = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTime,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyTrendPointImplCopyWith<$Res>
    implements $MonthlyTrendPointCopyWith<$Res> {
  factory _$$MonthlyTrendPointImplCopyWith(_$MonthlyTrendPointImpl value,
          $Res Function(_$MonthlyTrendPointImpl) then) =
      __$$MonthlyTrendPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime period, String label, double income, double expense});
}

/// @nodoc
class __$$MonthlyTrendPointImplCopyWithImpl<$Res>
    extends _$MonthlyTrendPointCopyWithImpl<$Res, _$MonthlyTrendPointImpl>
    implements _$$MonthlyTrendPointImplCopyWith<$Res> {
  __$$MonthlyTrendPointImplCopyWithImpl(_$MonthlyTrendPointImpl _value,
      $Res Function(_$MonthlyTrendPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? label = null,
    Object? income = null,
    Object? expense = null,
  }) {
    return _then(_$MonthlyTrendPointImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTime,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MonthlyTrendPointImpl implements _MonthlyTrendPoint {
  const _$MonthlyTrendPointImpl(
      {required this.period,
      required this.label,
      required this.income,
      required this.expense});

  @override
  final DateTime period;
  @override
  final String label;
  @override
  final double income;
  @override
  final double expense;

  @override
  String toString() {
    return 'MonthlyTrendPoint(period: $period, label: $label, income: $income, expense: $expense)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyTrendPointImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.expense, expense) || other.expense == expense));
  }

  @override
  int get hashCode => Object.hash(runtimeType, period, label, income, expense);

  /// Create a copy of MonthlyTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyTrendPointImplCopyWith<_$MonthlyTrendPointImpl> get copyWith =>
      __$$MonthlyTrendPointImplCopyWithImpl<_$MonthlyTrendPointImpl>(
          this, _$identity);
}

abstract class _MonthlyTrendPoint implements MonthlyTrendPoint {
  const factory _MonthlyTrendPoint(
      {required final DateTime period,
      required final String label,
      required final double income,
      required final double expense}) = _$MonthlyTrendPointImpl;

  @override
  DateTime get period;
  @override
  String get label;
  @override
  double get income;
  @override
  double get expense;

  /// Create a copy of MonthlyTrendPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyTrendPointImplCopyWith<_$MonthlyTrendPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnalysisSummary {
  List<EmotionInsight> get emotionInsights =>
      throw _privateConstructorUsedError;
  double get stressedSpending => throw _privateConstructorUsedError;
  String? get boredTopCategory => throw _privateConstructorUsedError;
  List<EffortInsight> get topEffortCategories =>
      throw _privateConstructorUsedError;
  double get discretionaryWasteHours => throw _privateConstructorUsedError;
  double get monthlyEffortHours => throw _privateConstructorUsedError;
  Map<String, double> get categoryDistribution =>
      throw _privateConstructorUsedError;
  List<MonthlyTrendPoint> get monthlyTrend =>
      throw _privateConstructorUsedError;

  /// Create a copy of AnalysisSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalysisSummaryCopyWith<AnalysisSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisSummaryCopyWith<$Res> {
  factory $AnalysisSummaryCopyWith(
          AnalysisSummary value, $Res Function(AnalysisSummary) then) =
      _$AnalysisSummaryCopyWithImpl<$Res, AnalysisSummary>;
  @useResult
  $Res call(
      {List<EmotionInsight> emotionInsights,
      double stressedSpending,
      String? boredTopCategory,
      List<EffortInsight> topEffortCategories,
      double discretionaryWasteHours,
      double monthlyEffortHours,
      Map<String, double> categoryDistribution,
      List<MonthlyTrendPoint> monthlyTrend});
}

/// @nodoc
class _$AnalysisSummaryCopyWithImpl<$Res, $Val extends AnalysisSummary>
    implements $AnalysisSummaryCopyWith<$Res> {
  _$AnalysisSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalysisSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionInsights = null,
    Object? stressedSpending = null,
    Object? boredTopCategory = freezed,
    Object? topEffortCategories = null,
    Object? discretionaryWasteHours = null,
    Object? monthlyEffortHours = null,
    Object? categoryDistribution = null,
    Object? monthlyTrend = null,
  }) {
    return _then(_value.copyWith(
      emotionInsights: null == emotionInsights
          ? _value.emotionInsights
          : emotionInsights // ignore: cast_nullable_to_non_nullable
              as List<EmotionInsight>,
      stressedSpending: null == stressedSpending
          ? _value.stressedSpending
          : stressedSpending // ignore: cast_nullable_to_non_nullable
              as double,
      boredTopCategory: freezed == boredTopCategory
          ? _value.boredTopCategory
          : boredTopCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      topEffortCategories: null == topEffortCategories
          ? _value.topEffortCategories
          : topEffortCategories // ignore: cast_nullable_to_non_nullable
              as List<EffortInsight>,
      discretionaryWasteHours: null == discretionaryWasteHours
          ? _value.discretionaryWasteHours
          : discretionaryWasteHours // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyEffortHours: null == monthlyEffortHours
          ? _value.monthlyEffortHours
          : monthlyEffortHours // ignore: cast_nullable_to_non_nullable
              as double,
      categoryDistribution: null == categoryDistribution
          ? _value.categoryDistribution
          : categoryDistribution // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      monthlyTrend: null == monthlyTrend
          ? _value.monthlyTrend
          : monthlyTrend // ignore: cast_nullable_to_non_nullable
              as List<MonthlyTrendPoint>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisSummaryImplCopyWith<$Res>
    implements $AnalysisSummaryCopyWith<$Res> {
  factory _$$AnalysisSummaryImplCopyWith(_$AnalysisSummaryImpl value,
          $Res Function(_$AnalysisSummaryImpl) then) =
      __$$AnalysisSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EmotionInsight> emotionInsights,
      double stressedSpending,
      String? boredTopCategory,
      List<EffortInsight> topEffortCategories,
      double discretionaryWasteHours,
      double monthlyEffortHours,
      Map<String, double> categoryDistribution,
      List<MonthlyTrendPoint> monthlyTrend});
}

/// @nodoc
class __$$AnalysisSummaryImplCopyWithImpl<$Res>
    extends _$AnalysisSummaryCopyWithImpl<$Res, _$AnalysisSummaryImpl>
    implements _$$AnalysisSummaryImplCopyWith<$Res> {
  __$$AnalysisSummaryImplCopyWithImpl(
      _$AnalysisSummaryImpl _value, $Res Function(_$AnalysisSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalysisSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emotionInsights = null,
    Object? stressedSpending = null,
    Object? boredTopCategory = freezed,
    Object? topEffortCategories = null,
    Object? discretionaryWasteHours = null,
    Object? monthlyEffortHours = null,
    Object? categoryDistribution = null,
    Object? monthlyTrend = null,
  }) {
    return _then(_$AnalysisSummaryImpl(
      emotionInsights: null == emotionInsights
          ? _value._emotionInsights
          : emotionInsights // ignore: cast_nullable_to_non_nullable
              as List<EmotionInsight>,
      stressedSpending: null == stressedSpending
          ? _value.stressedSpending
          : stressedSpending // ignore: cast_nullable_to_non_nullable
              as double,
      boredTopCategory: freezed == boredTopCategory
          ? _value.boredTopCategory
          : boredTopCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      topEffortCategories: null == topEffortCategories
          ? _value._topEffortCategories
          : topEffortCategories // ignore: cast_nullable_to_non_nullable
              as List<EffortInsight>,
      discretionaryWasteHours: null == discretionaryWasteHours
          ? _value.discretionaryWasteHours
          : discretionaryWasteHours // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyEffortHours: null == monthlyEffortHours
          ? _value.monthlyEffortHours
          : monthlyEffortHours // ignore: cast_nullable_to_non_nullable
              as double,
      categoryDistribution: null == categoryDistribution
          ? _value._categoryDistribution
          : categoryDistribution // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      monthlyTrend: null == monthlyTrend
          ? _value._monthlyTrend
          : monthlyTrend // ignore: cast_nullable_to_non_nullable
              as List<MonthlyTrendPoint>,
    ));
  }
}

/// @nodoc

class _$AnalysisSummaryImpl implements _AnalysisSummary {
  const _$AnalysisSummaryImpl(
      {required final List<EmotionInsight> emotionInsights,
      required this.stressedSpending,
      required this.boredTopCategory,
      required final List<EffortInsight> topEffortCategories,
      required this.discretionaryWasteHours,
      required this.monthlyEffortHours,
      required final Map<String, double> categoryDistribution,
      required final List<MonthlyTrendPoint> monthlyTrend})
      : _emotionInsights = emotionInsights,
        _topEffortCategories = topEffortCategories,
        _categoryDistribution = categoryDistribution,
        _monthlyTrend = monthlyTrend;

  final List<EmotionInsight> _emotionInsights;
  @override
  List<EmotionInsight> get emotionInsights {
    if (_emotionInsights is EqualUnmodifiableListView) return _emotionInsights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emotionInsights);
  }

  @override
  final double stressedSpending;
  @override
  final String? boredTopCategory;
  final List<EffortInsight> _topEffortCategories;
  @override
  List<EffortInsight> get topEffortCategories {
    if (_topEffortCategories is EqualUnmodifiableListView)
      return _topEffortCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topEffortCategories);
  }

  @override
  final double discretionaryWasteHours;
  @override
  final double monthlyEffortHours;
  final Map<String, double> _categoryDistribution;
  @override
  Map<String, double> get categoryDistribution {
    if (_categoryDistribution is EqualUnmodifiableMapView)
      return _categoryDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryDistribution);
  }

  final List<MonthlyTrendPoint> _monthlyTrend;
  @override
  List<MonthlyTrendPoint> get monthlyTrend {
    if (_monthlyTrend is EqualUnmodifiableListView) return _monthlyTrend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyTrend);
  }

  @override
  String toString() {
    return 'AnalysisSummary(emotionInsights: $emotionInsights, stressedSpending: $stressedSpending, boredTopCategory: $boredTopCategory, topEffortCategories: $topEffortCategories, discretionaryWasteHours: $discretionaryWasteHours, monthlyEffortHours: $monthlyEffortHours, categoryDistribution: $categoryDistribution, monthlyTrend: $monthlyTrend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisSummaryImpl &&
            const DeepCollectionEquality()
                .equals(other._emotionInsights, _emotionInsights) &&
            (identical(other.stressedSpending, stressedSpending) ||
                other.stressedSpending == stressedSpending) &&
            (identical(other.boredTopCategory, boredTopCategory) ||
                other.boredTopCategory == boredTopCategory) &&
            const DeepCollectionEquality()
                .equals(other._topEffortCategories, _topEffortCategories) &&
            (identical(
                    other.discretionaryWasteHours, discretionaryWasteHours) ||
                other.discretionaryWasteHours == discretionaryWasteHours) &&
            (identical(other.monthlyEffortHours, monthlyEffortHours) ||
                other.monthlyEffortHours == monthlyEffortHours) &&
            const DeepCollectionEquality()
                .equals(other._categoryDistribution, _categoryDistribution) &&
            const DeepCollectionEquality()
                .equals(other._monthlyTrend, _monthlyTrend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_emotionInsights),
      stressedSpending,
      boredTopCategory,
      const DeepCollectionEquality().hash(_topEffortCategories),
      discretionaryWasteHours,
      monthlyEffortHours,
      const DeepCollectionEquality().hash(_categoryDistribution),
      const DeepCollectionEquality().hash(_monthlyTrend));

  /// Create a copy of AnalysisSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisSummaryImplCopyWith<_$AnalysisSummaryImpl> get copyWith =>
      __$$AnalysisSummaryImplCopyWithImpl<_$AnalysisSummaryImpl>(
          this, _$identity);
}

abstract class _AnalysisSummary implements AnalysisSummary {
  const factory _AnalysisSummary(
          {required final List<EmotionInsight> emotionInsights,
          required final double stressedSpending,
          required final String? boredTopCategory,
          required final List<EffortInsight> topEffortCategories,
          required final double discretionaryWasteHours,
          required final double monthlyEffortHours,
          required final Map<String, double> categoryDistribution,
          required final List<MonthlyTrendPoint> monthlyTrend}) =
      _$AnalysisSummaryImpl;

  @override
  List<EmotionInsight> get emotionInsights;
  @override
  double get stressedSpending;
  @override
  String? get boredTopCategory;
  @override
  List<EffortInsight> get topEffortCategories;
  @override
  double get discretionaryWasteHours;
  @override
  double get monthlyEffortHours;
  @override
  Map<String, double> get categoryDistribution;
  @override
  List<MonthlyTrendPoint> get monthlyTrend;

  /// Create a copy of AnalysisSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalysisSummaryImplCopyWith<_$AnalysisSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
