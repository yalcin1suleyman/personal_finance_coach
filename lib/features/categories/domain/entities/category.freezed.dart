// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FinanceCategory _$FinanceCategoryFromJson(Map<String, dynamic> json) {
  return _FinanceCategory.fromJson(json);
}

/// @nodoc
mixin _$FinanceCategory {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get emoji => throw _privateConstructorUsedError;
  @HiveField(3)
  CategoryType get type => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get isEditable => throw _privateConstructorUsedError;
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FinanceCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinanceCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceCategoryCopyWith<FinanceCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceCategoryCopyWith<$Res> {
  factory $FinanceCategoryCopyWith(
          FinanceCategory value, $Res Function(FinanceCategory) then) =
      _$FinanceCategoryCopyWithImpl<$Res, FinanceCategory>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String emoji,
      @HiveField(3) CategoryType type,
      @HiveField(4) bool isEditable,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class _$FinanceCategoryCopyWithImpl<$Res, $Val extends FinanceCategory>
    implements $FinanceCategoryCopyWith<$Res> {
  _$FinanceCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emoji = null,
    Object? type = null,
    Object? isEditable = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinanceCategoryImplCopyWith<$Res>
    implements $FinanceCategoryCopyWith<$Res> {
  factory _$$FinanceCategoryImplCopyWith(_$FinanceCategoryImpl value,
          $Res Function(_$FinanceCategoryImpl) then) =
      __$$FinanceCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String emoji,
      @HiveField(3) CategoryType type,
      @HiveField(4) bool isEditable,
      @HiveField(5) DateTime createdAt});
}

/// @nodoc
class __$$FinanceCategoryImplCopyWithImpl<$Res>
    extends _$FinanceCategoryCopyWithImpl<$Res, _$FinanceCategoryImpl>
    implements _$$FinanceCategoryImplCopyWith<$Res> {
  __$$FinanceCategoryImplCopyWithImpl(
      _$FinanceCategoryImpl _value, $Res Function(_$FinanceCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emoji = null,
    Object? type = null,
    Object? isEditable = null,
    Object? createdAt = null,
  }) {
    return _then(_$FinanceCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
      isEditable: null == isEditable
          ? _value.isEditable
          : isEditable // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FinanceCategoryImpl extends _FinanceCategory {
  const _$FinanceCategoryImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.emoji,
      @HiveField(3) required this.type,
      @HiveField(4) required this.isEditable,
      @HiveField(5) required this.createdAt})
      : super._();

  factory _$FinanceCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinanceCategoryImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String emoji;
  @override
  @HiveField(3)
  final CategoryType type;
  @override
  @HiveField(4)
  final bool isEditable;
  @override
  @HiveField(5)
  final DateTime createdAt;

  @override
  String toString() {
    return 'FinanceCategory(id: $id, name: $name, emoji: $emoji, type: $type, isEditable: $isEditable, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinanceCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isEditable, isEditable) ||
                other.isEditable == isEditable) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, emoji, type, isEditable, createdAt);

  /// Create a copy of FinanceCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinanceCategoryImplCopyWith<_$FinanceCategoryImpl> get copyWith =>
      __$$FinanceCategoryImplCopyWithImpl<_$FinanceCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FinanceCategoryImplToJson(
      this,
    );
  }
}

abstract class _FinanceCategory extends FinanceCategory {
  const factory _FinanceCategory(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String emoji,
      @HiveField(3) required final CategoryType type,
      @HiveField(4) required final bool isEditable,
      @HiveField(5) required final DateTime createdAt}) = _$FinanceCategoryImpl;
  const _FinanceCategory._() : super._();

  factory _FinanceCategory.fromJson(Map<String, dynamic> json) =
      _$FinanceCategoryImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get emoji;
  @override
  @HiveField(3)
  CategoryType get type;
  @override
  @HiveField(4)
  bool get isEditable;
  @override
  @HiveField(5)
  DateTime get createdAt;

  /// Create a copy of FinanceCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinanceCategoryImplCopyWith<_$FinanceCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
