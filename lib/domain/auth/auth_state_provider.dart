import 'package:flutter_firebase_auth/domain/auth/auth_usecase.dart';
import 'package:flutter_firebase_auth/domain/profile/health/steps.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthStateNotifier extends StateNotifier<Profile> {
  final Ref ref;
  final AuthUsecase _authUsecase;

  AuthStateNotifier(this.ref, this._authUsecase)
      : super(const Profile(
          uid: '',
          displayName: '',
          email: '',
          phoneNumber: '',
          photoUrl: '',
          steps: Steps(count: 0),
        ));

  Future<void> signIn() async {
    final profile = await _authUsecase.signIn();
    // サインインに成功した時、state にプロフィール情報を積める
    if (profile != null) {
      state = profile;
    }
  }
}
