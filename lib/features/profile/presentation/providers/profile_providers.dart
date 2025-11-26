import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_finance_coach/core/providers/app_providers.dart';
import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';
import 'package:personal_finance_coach/features/profile/domain/repositories/profile_repository.dart';

final profileStreamProvider = StreamProvider<UserProfile>((ref) {
  var loggedFirstEmission = false;
  return ref.watch(profileRepositoryProvider).watchProfile().map((profile) {
    if (!loggedFirstEmission) {
      debugPrint('[ProfileStreamProvider] First value emitted');
      loggedFirstEmission = true;
    }
    return profile;
  });
});

final profileControllerProvider = Provider<ProfileController>((ref) {
  return ProfileController(ref.watch(profileRepositoryProvider));
});

class ProfileController {
  ProfileController(this._repository);

  final ProfileRepository _repository;

  Future<void> save(UserProfile profile) => _repository.updateProfile(profile.copyWith(updatedAt: DateTime.now()));
}




