import 'package:hive/hive.dart';

part 'theme_preference.g.dart';

@HiveType(typeId: 11)
enum ThemePreference {
  @HiveField(0)
  system,
  @HiveField(1)
  light,
  @HiveField(2)
  dark,
}

extension ThemePreferenceX on ThemePreference {
  String get label {
    switch (this) {
      case ThemePreference.system:
        return 'Sistem';
      case ThemePreference.light:
        return 'Aydınlık';
      case ThemePreference.dark:
        return 'Karanlık';
    }
  }
}

