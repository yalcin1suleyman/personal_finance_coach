// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_preference.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemePreferenceAdapter extends TypeAdapter<ThemePreference> {
  @override
  final int typeId = 11;

  @override
  ThemePreference read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemePreference.system;
      case 1:
        return ThemePreference.light;
      case 2:
        return ThemePreference.dark;
      default:
        return ThemePreference.system;
    }
  }

  @override
  void write(BinaryWriter writer, ThemePreference obj) {
    switch (obj) {
      case ThemePreference.system:
        writer.writeByte(0);
        break;
      case ThemePreference.light:
        writer.writeByte(1);
        break;
      case ThemePreference.dark:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemePreferenceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
