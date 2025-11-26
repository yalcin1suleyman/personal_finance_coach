import 'dart:async';

import 'package:hive/hive.dart';
import 'package:personal_finance_coach/core/constants/app_constants.dart';
import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';

class ProfileLocalDataSource {
  ProfileLocalDataSource() : _box = Hive.box<UserProfile>(AppConstants.hiveProfileBox);

  static const String _profileKey = 'profile';
  final Box<UserProfile> _box;

  Stream<UserProfile> watchProfile() {
    return Stream<UserProfile>.multi((controller) {
      void emitProfile(UserProfile profile) => controller.add(profile);

      final existing = _box.get(_profileKey) ?? UserProfile.empty();
      emitProfile(existing);

      final subscription = _box.watch(key: _profileKey).listen((event) {
        final newValue = event.value as UserProfile?;
        if (newValue != null) {
          emitProfile(newValue);
        }
      });

      controller.onCancel = subscription.cancel;
    });
  }

  Future<UserProfile> load() async {
    final profile = _box.get(_profileKey);
    if (profile != null) return profile;
    final created = UserProfile.empty();
    await _box.put(_profileKey, created);
    return created;
  }

  Future<void> save(UserProfile profile) => _box.put(_profileKey, profile);

  Future<void> dispose() async {
    // No-op: multi-stream handles cancellation per listener.
  }
}



