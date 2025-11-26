// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurring_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecurringPayment _$RecurringPaymentFromJson(Map<String, dynamic> json) {
  return _RecurringPayment.fromJson(json);
}

/// @nodoc
mixin _$RecurringPayment {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get title => throw _privateConstructorUsedError;
  @HiveField(2)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(3)
  RecurrenceFrequency get frequency => throw _privateConstructorUsedError;
  @HiveField(4)
  DateTime get nextPaymentDate => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get isIncome => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get accountId => throw _privateConstructorUsedError;
  @HiveField(7)
  String? get categoryId => throw _privateConstructorUsedError;

  /// Serializes this RecurringPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecurringPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecurringPaymentCopyWith<RecurringPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringPaymentCopyWith<$Res> {
  factory $RecurringPaymentCopyWith(
          RecurringPayment value, $Res Function(RecurringPayment) then) =
      _$RecurringPaymentCopyWithImpl<$Res, RecurringPayment>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) double amount,
      @HiveField(3) RecurrenceFrequency frequency,
      @HiveField(4) DateTime nextPaymentDate,
      @HiveField(5) bool isIncome,
      @HiveField(6) String? accountId,
      @HiveField(7) String? categoryId});
}

/// @nodoc
class _$RecurringPaymentCopyWithImpl<$Res, $Val extends RecurringPayment>
    implements $RecurringPaymentCopyWith<$Res> {
  _$RecurringPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurringPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? frequency = null,
    Object? nextPaymentDate = null,
    Object? isIncome = null,
    Object? accountId = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      nextPaymentDate: null == nextPaymentDate
          ? _value.nextPaymentDate
          : nextPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isIncome: null == isIncome
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecurringPaymentImplCopyWith<$Res>
    implements $RecurringPaymentCopyWith<$Res> {
  factory _$$RecurringPaymentImplCopyWith(_$RecurringPaymentImpl value,
          $Res Function(_$RecurringPaymentImpl) then) =
      __$$RecurringPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String title,
      @HiveField(2) double amount,
      @HiveField(3) RecurrenceFrequency frequency,
      @HiveField(4) DateTime nextPaymentDate,
      @HiveField(5) bool isIncome,
      @HiveField(6) String? accountId,
      @HiveField(7) String? categoryId});
}

/// @nodoc
class __$$RecurringPaymentImplCopyWithImpl<$Res>
    extends _$RecurringPaymentCopyWithImpl<$Res, _$RecurringPaymentImpl>
    implements _$$RecurringPaymentImplCopyWith<$Res> {
  __$$RecurringPaymentImplCopyWithImpl(_$RecurringPaymentImpl _value,
      $Res Function(_$RecurringPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurringPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? frequency = null,
    Object? nextPaymentDate = null,
    Object? isIncome = null,
    Object? accountId = freezed,
    Object? categoryId = freezed,
  }) {
    return _then(_$RecurringPaymentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      nextPaymentDate: null == nextPaymentDate
          ? _value.nextPaymentDate
          : nextPaymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isIncome: null == isIncome
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecurringPaymentImpl extends _RecurringPayment {
  const _$RecurringPaymentImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.title,
      @HiveField(2) required this.amount,
      @HiveField(3) required this.frequency,
      @HiveField(4) required this.nextPaymentDate,
      @HiveField(5) required this.isIncome,
      @HiveField(6) this.accountId,
      @HiveField(7) this.categoryId})
      : super._();

  factory _$RecurringPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringPaymentImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String title;
  @override
  @HiveField(2)
  final double amount;
  @override
  @HiveField(3)
  final RecurrenceFrequency frequency;
  @override
  @HiveField(4)
  final DateTime nextPaymentDate;
  @override
  @HiveField(5)
  final bool isIncome;
  @override
  @HiveField(6)
  final String? accountId;
  @override
  @HiveField(7)
  final String? categoryId;

  @override
  String toString() {
    return 'RecurringPayment(id: $id, title: $title, amount: $amount, frequency: $frequency, nextPaymentDate: $nextPaymentDate, isIncome: $isIncome, accountId: $accountId, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringPaymentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.nextPaymentDate, nextPaymentDate) ||
                other.nextPaymentDate == nextPaymentDate) &&
            (identical(other.isIncome, isIncome) ||
                other.isIncome == isIncome) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, amount, frequency,
      nextPaymentDate, isIncome, accountId, categoryId);

  /// Create a copy of RecurringPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringPaymentImplCopyWith<_$RecurringPaymentImpl> get copyWith =>
      __$$RecurringPaymentImplCopyWithImpl<_$RecurringPaymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringPaymentImplToJson(
      this,
    );
  }
}

abstract class _RecurringPayment extends RecurringPayment {
  const factory _RecurringPayment(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String title,
      @HiveField(2) required final double amount,
      @HiveField(3) required final RecurrenceFrequency frequency,
      @HiveField(4) required final DateTime nextPaymentDate,
      @HiveField(5) required final bool isIncome,
      @HiveField(6) final String? accountId,
      @HiveField(7) final String? categoryId}) = _$RecurringPaymentImpl;
  const _RecurringPayment._() : super._();

  factory _RecurringPayment.fromJson(Map<String, dynamic> json) =
      _$RecurringPaymentImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get title;
  @override
  @HiveField(2)
  double get amount;
  @override
  @HiveField(3)
  RecurrenceFrequency get frequency;
  @override
  @HiveField(4)
  DateTime get nextPaymentDate;
  @override
  @HiveField(5)
  bool get isIncome;
  @override
  @HiveField(6)
  String? get accountId;
  @override
  @HiveField(7)
  String? get categoryId;

  /// Create a copy of RecurringPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurringPaymentImplCopyWith<_$RecurringPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
