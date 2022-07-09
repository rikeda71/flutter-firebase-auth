import 'package:flutter_firebase_auth/domain/auth/auth_repository.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_usecase.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';
import 'package:flutter_firebase_auth/infrastructure/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authStateNotifier = StateNotifierProvider<AuthStateNotifier, Profile>(
    (ref) => AuthStateNotifier(ref));

class AuthStateNotifier extends StateNotifier<Profile> {
  // TODO: https://zuma-lab.com/posts/flutter-search-github-riverpod-di
  // 上記を参考に、DI した usecase を参照
  // final authUsecase = AuthUsecase(authRepository: authRepository);
  final AuthRepository _authRepository = AuthRepositoryImpl();

  final Ref ref;

  AuthStateNotifier(this.ref)
      : super(const Profile(
            displayName: '', email: '', phoneNumber: '', photoUrl: ''));

  Future<void> signIn() async {
    final authUsecase = AuthUsecase(authRepository: _authRepository);
    final profile = await authUsecase.signIn();
    // サインインに成功した時、state にプロフィール情報を積める
    if (profile != null) {
      state = profile;
    }
  }
}
