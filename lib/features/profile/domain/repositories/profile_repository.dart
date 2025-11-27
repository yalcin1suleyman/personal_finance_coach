import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';

abstract class ProfileRepository {
  Stream<UserProfile> watchProfile();
  Future<UserProfile> getProfile();
  Future<void> updateProfile(UserProfile profile);
}






