// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceCategoryAdapter extends TypeAdapter<FinanceCategory> {
  @override
  final int typeId = 3;

  @override
  FinanceCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinanceCategory(
      id: fields[0] as String,
      name: fields[1] as String,
      emoji: fields[2] as String,
      type: fields[3] as CategoryType,
      isEditable: fields[4] as bool,
      createdAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FinanceCategory obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.emoji)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.isEditable)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinanceCategoryImpl _$$FinanceCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$FinanceCategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
      isEditable: json['isEditable'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$FinanceCategoryImplToJson(
        _$FinanceCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emoji': instance.emoji,
      'type': _$CategoryTypeEnumMap[instance.type]!,
      'isEditable': instance.isEditable,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$CategoryTypeEnumMap = {
  CategoryType.income: 'income',
  CategoryType.expense: 'expense',
};
