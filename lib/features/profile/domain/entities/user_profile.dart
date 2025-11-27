import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/enums/theme_preference.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
@HiveType(typeId: 1)
class UserProfile with _$UserProfile {
  const factory UserProfile({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required ThemePreference themePreference,
    @HiveField(3) required double monthlyIncome,
    @HiveField(4) required double weeklyWorkHours,
    @HiveField(5) required String currencyCode,
    @HiveField(6) required DateTime createdAt,
    @HiveField(7) required DateTime updatedAt,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.empty() {
    final now = DateTime.now();
    return UserProfile(
      id: 'profile',
      name: 'Koç',
      themePreference: ThemePreference.system,
      monthlyIncome: 0,
      weeklyWorkHours: 40,
      currencyCode: 'TRY',
      createdAt: now,
      updatedAt: now,
    );
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  double get hourlyIncome {
    final denominator = weeklyWorkHours == 0 ? 1 : (weeklyWorkHours * 4);
    if (denominator == 0) return 0;
    return monthlyIncome / denominator;
  }

  double get dailyIncome => hourlyIncome * 8;
}






