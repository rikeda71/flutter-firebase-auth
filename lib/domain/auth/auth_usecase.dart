import 'package:flutter_firebase_auth/domain/auth/auth_repository.dart';
import 'package:flutter_firebase_auth/domain/profile/health/health_repository.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';

class AuthUsecase {
  AuthUsecase(this._authRepository, this._healthRepository);

  final AuthRepository _authRepository;

  final HealthRepository _healthRepository;

  Future<Profile?> signIn() async {
    final profile = await _authRepository.signin();
    if (profile == null) {
      return profile;
    }
    final steps = await _healthRepository.getSteps();
    profile.setStepCount(steps);
    return profile;
  }
}
