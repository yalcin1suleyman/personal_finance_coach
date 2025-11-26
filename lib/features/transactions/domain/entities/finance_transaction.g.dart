// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceTransactionAdapter extends TypeAdapter<FinanceTransaction> {
  @override
  final int typeId = 4;

  @override
  FinanceTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinanceTransaction(
      id: fields[0] as String,
      isIncome: fields[1] as bool,
      amount: fields[2] as double,
      title: fields[3] as String,
      description: fields[4] as String?,
      date: fields[5] as DateTime,
      accountId: fields[6] as String,
      categoryId: fields[7] as String,
      receiptPath: fields[8] as String?,
      mood: fields[9] as Mood,
      regret: fields[10] as bool?,
      effortHours: fields[11] as double,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
      regretAskedAt: fields[14] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, FinanceTransaction obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isIncome)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.accountId)
      ..writeByte(7)
      ..write(obj.categoryId)
      ..writeByte(8)
      ..write(obj.receiptPath)
      ..writeByte(9)
      ..write(obj.mood)
      ..writeByte(10)
      ..write(obj.regret)
      ..writeByte(11)
      ..write(obj.effortHours)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt)
      ..writeByte(14)
      ..write(obj.regretAskedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinanceTransactionImpl _$$FinanceTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$FinanceTransactionImpl(
      id: json['id'] as String,
      isIncome: json['isIncome'] as bool,
      amount: (json['amount'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String?,
      date: DateTime.parse(json['date'] as String),
      accountId: json['accountId'] as String,
      categoryId: json['categoryId'] as String,
      receiptPath: json['receiptPath'] as String?,
      mood: $enumDecode(_$MoodEnumMap, json['mood']),
      regret: json['regret'] as bool?,
      effortHours: (json['effortHours'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      regretAskedAt: json['regretAskedAt'] == null
          ? null
          : DateTime.parse(json['regretAskedAt'] as String),
    );

Map<String, dynamic> _$$FinanceTransactionImplToJson(
        _$FinanceTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isIncome': instance.isIncome,
      'amount': instance.amount,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'accountId': instance.accountId,
      'categoryId': instance.categoryId,
      'receiptPath': instance.receiptPath,
      'mood': _$MoodEnumMap[instance.mood]!,
      'regret': instance.regret,
      'effortHours': instance.effortHours,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'regretAskedAt': instance.regretAskedAt?.toIso8601String(),
    };

const _$MoodEnumMap = {
  Mood.veryHappy: 'veryHappy',
  Mood.happy: 'happy',
  Mood.neutral: 'neutral',
  Mood.bored: 'bored',
  Mood.stressed: 'stressed',
  Mood.sad: 'sad',
  Mood.tired: 'tired',
};
