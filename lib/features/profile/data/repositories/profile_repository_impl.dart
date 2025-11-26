import 'package:personal_finance_coach/features/profile/data/datasources/profile_local_data_source.dart';
import 'package:personal_finance_coach/features/profile/domain/entities/user_profile.dart';
import 'package:personal_finance_coach/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this._localDataSource);

  final ProfileLocalDataSource _localDataSource;

  @override
  Future<UserProfile> getProfile() => _localDataSource.load();

  @override
  Future<void> updateProfile(UserProfile profile) => _localDataSource.save(profile);

  @override
  Stream<UserProfile> watchProfile() => _localDataSource.watchProfile();
}





