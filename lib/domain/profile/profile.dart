import 'package:flutter_firebase_auth/domain/profile/health/steps.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  const factory Profile({
    required String uid,
    required String displayName,
    required String email,
    required String phoneNumber,
    required String photoUrl,
    required Steps steps,
  }) = _Profile;

  Profile setStepCount(Steps steps) {
    return copyWith(steps: steps);
  }
}
