import 'package:flutter_firebase_auth/domain/auth/auth_repository.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_state_provider.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_usecase.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';
import 'package:flutter_firebase_auth/infrastructure/auth_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authRepositoryProvider =
    Provider.autoDispose<AuthRepository>((_) => AuthRepositoryImpl());

final authUsecaseProvider = Provider.autoDispose<AuthUsecase>(
    (ref) => AuthUsecase(ref.read(authRepositoryProvider)));

final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, Profile>(
        (ref) => AuthStateNotifier(ref, ref.read(authUsecaseProvider)));
