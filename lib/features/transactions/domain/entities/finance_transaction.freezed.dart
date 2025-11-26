// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinanceTransaction _$FinanceTransactionFromJson(Map<String, dynamic> json) {
  return _FinanceTransaction.fromJson(json);
}

/// @nodoc
mixin _$FinanceTransaction {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get isIncome => throw _privateConstructorUsedError;
  @HiveField(2)
  double get amount => throw _privateConstructorUsedError;
  @HiveField(3)
  String get title => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(6)
  String get accountId => throw _privateConstructorUsedError;
  @HiveField(7)
  String get categoryId => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get receiptPath => throw _privateConstructorUsedError;
  @HiveField(9)
  Mood get mood => throw _privateConstructorUsedError;
  @HiveField(10)
  bool? get regret => throw _privateConstructorUsedError;
  @HiveField(11)
  double get effortHours => throw _privateConstructorUsedError;
  @HiveField(12)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(13)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(14)
  DateTime? get regretAskedAt => throw _privateConstructorUsedError;

  /// Serializes this FinanceTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceTransactionCopyWith<FinanceTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceTransactionCopyWith<$Res> {
  factory $FinanceTransactionCopyWith(
          FinanceTransaction value, $Res Function(FinanceTransaction) then) =
      _$FinanceTransactionCopyWithImpl<$Res, FinanceTransaction>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) bool isIncome,
      @HiveField(2) double amount,
      @HiveField(3) String title,
      @HiveField(4) String? description,
      @HiveField(5) DateTime date,
      @HiveField(6) String accountId,
      @HiveField(7) String categoryId,
      @HiveField(8) String? receiptPath,
      @HiveField(9) Mood mood,
      @HiveField(10) bool? regret,
      @HiveField(11) double effortHours,
      @HiveField(12) DateTime createdAt,
      @HiveField(13) DateTime updatedAt,
      @HiveField(14) DateTime? regretAskedAt});
}

/// @nodoc
class _$FinanceTransactionCopyWithImpl<$Res, $Val extends FinanceTransaction>
    implements $FinanceTransactionCopyWith<$Res> {
  _$FinanceTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isIncome = null,
    Object? amount = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? accountId = null,
    Object? categoryId = null,
    Object? receiptPath = freezed,
    Object? mood = null,
    Object? regret = freezed,
    Object? effortHours = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? regretAskedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isIncome: null == isIncome
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      receiptPath: freezed == receiptPath
          ? _value.receiptPath
          : receiptPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      regret: freezed == regret
          ? _value.regret
          : regret // ignore: cast_nullable_to_non_nullable
              as bool?,
      effortHours: null == effortHours
          ? _value.effortHours
          : effortHours // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      regretAskedAt: freezed == regretAskedAt
          ? _value.regretAskedAt
          : regretAskedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinanceTransactionImplCopyWith<$Res>
    implements $FinanceTransactionCopyWith<$Res> {
  factory _$$FinanceTransactionImplCopyWith(_$FinanceTransactionImpl value,
          $Res Function(_$FinanceTransactionImpl) then) =
      __$$FinanceTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) bool isIncome,
      @HiveField(2) double amount,
      @HiveField(3) String title,
      @HiveField(4) String? description,
      @HiveField(5) DateTime date,
      @HiveField(6) String accountId,
      @HiveField(7) String categoryId,
      @HiveField(8) String? receiptPath,
      @HiveField(9) Mood mood,
      @HiveField(10) bool? regret,
      @HiveField(11) double effortHours,
      @HiveField(12) DateTime createdAt,
      @HiveField(13) DateTime updatedAt,
      @HiveField(14) DateTime? regretAskedAt});
}

/// @nodoc
class __$$FinanceTransactionImplCopyWithImpl<$Res>
    extends _$FinanceTransactionCopyWithImpl<$Res, _$FinanceTransactionImpl>
    implements _$$FinanceTransactionImplCopyWith<$Res> {
  __$$FinanceTransactionImplCopyWithImpl(_$FinanceTransactionImpl _value,
      $Res Function(_$FinanceTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isIncome = null,
    Object? amount = null,
    Object? title = null,
    Object? description = freezed,
    Object? date = null,
    Object? accountId = null,
    Object? categoryId = null,
    Object? receiptPath = freezed,
    Object? mood = null,
    Object? regret = freezed,
    Object? effortHours = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? regretAskedAt = freezed,
  }) {
    return _then(_$FinanceTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isIncome: null == isIncome
          ? _value.isIncome
          : isIncome // ignore: cast_nullable_to_non_nullable
              as bool,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      receiptPath: freezed == receiptPath
          ? _value.receiptPath
          : receiptPath // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      regret: freezed == regret
          ? _value.regret
          : regret // ignore: cast_nullable_to_non_nullable
              as bool?,
      effortHours: null == effortHours
          ? _value.effortHours
          : effortHours // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      regretAskedAt: freezed == regretAskedAt
          ? _value.regretAskedAt
          : regretAskedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceTransactionImpl extends _FinanceTransaction {
  const _$FinanceTransactionImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.isIncome,
      @HiveField(2) required this.amount,
      @HiveField(3) required this.title,
      @HiveField(4) this.description,
      @HiveField(5) required this.date,
      @HiveField(6) required this.accountId,
      @HiveField(7) required this.categoryId,
      @HiveField(8) this.receiptPath,
      @HiveField(9) required this.mood,
      @HiveField(10) this.regret,
      @HiveField(11) required this.effortHours,
      @HiveField(12) required this.createdAt,
      @HiveField(13) required this.updatedAt,
      @HiveField(14) this.regretAskedAt})
      : super._();

  factory _$FinanceTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceTransactionImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final bool isIncome;
  @override
  @HiveField(2)
  final double amount;
  @override
  @HiveField(3)
  final String title;
  @override
  @HiveField(4)
  final String? description;
  @override
  @HiveField(5)
  final DateTime date;
  @override
  @HiveField(6)
  final String accountId;
  @override
  @HiveField(7)
  final String categoryId;
  @override
  @HiveField(8)
  final String? receiptPath;
  @override
  @HiveField(9)
  final Mood mood;
  @override
  @HiveField(10)
  final bool? regret;
  @override
  @HiveField(11)
  final double effortHours;
  @override
  @HiveField(12)
  final DateTime createdAt;
  @override
  @HiveField(13)
  final DateTime updatedAt;
  @override
  @HiveField(14)
  final DateTime? regretAskedAt;

  @override
  String toString() {
    return 'FinanceTransaction(id: $id, isIncome: $isIncome, amount: $amount, title: $title, description: $description, date: $date, accountId: $accountId, categoryId: $categoryId, receiptPath: $receiptPath, mood: $mood, regret: $regret, effortHours: $effortHours, createdAt: $createdAt, updatedAt: $updatedAt, regretAskedAt: $regretAskedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isIncome, isIncome) ||
                other.isIncome == isIncome) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.receiptPath, receiptPath) ||
                other.receiptPath == receiptPath) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.regret, regret) || other.regret == regret) &&
            (identical(other.effortHours, effortHours) ||
                other.effortHours == effortHours) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.regretAskedAt, regretAskedAt) ||
                other.regretAskedAt == regretAskedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isIncome,
      amount,
      title,
      description,
      date,
      accountId,
      categoryId,
      receiptPath,
      mood,
      regret,
      effortHours,
      createdAt,
      updatedAt,
      regretAskedAt);

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceTransactionImplCopyWith<_$FinanceTransactionImpl> get copyWith =>
      __$$FinanceTransactionImplCopyWithImpl<_$FinanceTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceTransactionImplToJson(
      this,
    );
  }
}

abstract class _FinanceTransaction extends FinanceTransaction {
  const factory _FinanceTransaction(
      {@HiveField(0) required final String id,
      @HiveField(1) required final bool isIncome,
      @HiveField(2) required final double amount,
      @HiveField(3) required final String title,
      @HiveField(4) final String? description,
      @HiveField(5) required final DateTime date,
      @HiveField(6) required final String accountId,
      @HiveField(7) required final String categoryId,
      @HiveField(8) final String? receiptPath,
      @HiveField(9) required final Mood mood,
      @HiveField(10) final bool? regret,
      @HiveField(11) required final double effortHours,
      @HiveField(12) required final DateTime createdAt,
      @HiveField(13) required final DateTime updatedAt,
      @HiveField(14) final DateTime? regretAskedAt}) = _$FinanceTransactionImpl;
  const _FinanceTransaction._() : super._();

  factory _FinanceTransaction.fromJson(Map<String, dynamic> json) =
      _$FinanceTransactionImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  bool get isIncome;
  @override
  @HiveField(2)
  double get amount;
  @override
  @HiveField(3)
  String get title;
  @override
  @HiveField(4)
  String? get description;
  @override
  @HiveField(5)
  DateTime get date;
  @override
  @HiveField(6)
  String get accountId;
  @override
  @HiveField(7)
  String get categoryId;
  @override
  @HiveField(8)
  String? get receiptPath;
  @override
  @HiveField(9)
  Mood get mood;
  @override
  @HiveField(10)
  bool? get regret;
  @override
  @HiveField(11)
  double get effortHours;
  @override
  @HiveField(12)
  DateTime get createdAt;
  @override
  @HiveField(13)
  DateTime get updatedAt;
  @override
  @HiveField(14)
  DateTime? get regretAskedAt;

  /// Create a copy of FinanceTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceTransactionImplCopyWith<_$FinanceTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
