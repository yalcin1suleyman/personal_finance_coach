// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoodAdapter extends TypeAdapter<Mood> {
  @override
  final int typeId = 10;

  @override
  Mood read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Mood.veryHappy;
      case 1:
        return Mood.happy;
      case 2:
        return Mood.neutral;
      case 3:
        return Mood.bored;
      case 4:
        return Mood.stressed;
      case 5:
        return Mood.sad;
      case 6:
        return Mood.tired;
      default:
        return Mood.veryHappy;
    }
  }

  @override
  void write(BinaryWriter writer, Mood obj) {
    switch (obj) {
      case Mood.veryHappy:
        writer.writeByte(0);
        break;
      case Mood.happy:
        writer.writeByte(1);
        break;
      case Mood.neutral:
        writer.writeByte(2);
        break;
      case Mood.bored:
        writer.writeByte(3);
        break;
      case Mood.stressed:
        writer.writeByte(4);
        break;
      case Mood.sad:
        writer.writeByte(5);
        break;
      case Mood.tired:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
