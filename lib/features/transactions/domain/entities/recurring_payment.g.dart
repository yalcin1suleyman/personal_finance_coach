// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_payment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecurringPaymentAdapter extends TypeAdapter<RecurringPayment> {
  @override
  final int typeId = 5;

  @override
  RecurringPayment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecurringPayment(
      id: fields[0] as String,
      title: fields[1] as String,
      amount: fields[2] as double,
      frequency: fields[3] as RecurrenceFrequency,
      nextPaymentDate: fields[4] as DateTime,
      isIncome: fields[5] as bool,
      accountId: fields[6] as String?,
      categoryId: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecurringPayment obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.frequency)
      ..writeByte(4)
      ..write(obj.nextPaymentDate)
      ..writeByte(5)
      ..write(obj.isIncome)
      ..writeByte(6)
      ..write(obj.accountId)
      ..writeByte(7)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecurringPaymentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecurringPaymentImpl _$$RecurringPaymentImplFromJson(
        Map<String, dynamic> json) =>
    _$RecurringPaymentImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      frequency: $enumDecode(_$RecurrenceFrequencyEnumMap, json['frequency']),
      nextPaymentDate: DateTime.parse(json['nextPaymentDate'] as String),
      isIncome: json['isIncome'] as bool,
      accountId: json['accountId'] as String?,
      categoryId: json['categoryId'] as String?,
    );

Map<String, dynamic> _$$RecurringPaymentImplToJson(
        _$RecurringPaymentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'frequency': _$RecurrenceFrequencyEnumMap[instance.frequency]!,
      'nextPaymentDate': instance.nextPaymentDate.toIso8601String(),
      'isIncome': instance.isIncome,
      'accountId': instance.accountId,
      'categoryId': instance.categoryId,
    };

const _$RecurrenceFrequencyEnumMap = {
  RecurrenceFrequency.daily: 'daily',
  RecurrenceFrequency.weekly: 'weekly',
  RecurrenceFrequency.monthly: 'monthly',
  RecurrenceFrequency.yearly: 'yearly',
};
