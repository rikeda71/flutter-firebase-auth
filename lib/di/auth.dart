import 'package:flutter_firebase_auth/di/health.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_repository.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_state_provider.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_usecase.dart';
import 'package:flutter_firebase_auth/domain/auth/firebase_auth_provider.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';
import 'package:flutter_firebase_auth/infrastructure/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.read(firebaseAuthProvider)));

final authUsecaseProvider = Provider.autoDispose<AuthUsecase>(
  (ref) => AuthUsecase(
    ref.read(authRepositoryProvider),
    ref.read(healthRepositoryProvider),
  ),
);

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, Profile>(
        (ref) => AuthStateNotifier(ref, ref.read(authUsecaseProvider)));
