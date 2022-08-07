import 'package:flutter_firebase_auth/di/firestore.dart';
import 'package:flutter_firebase_auth/domain/profile/health/health_factory_provider.dart';
import 'package:flutter_firebase_auth/infrastructure/health_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final healthRepositoryProvider = Provider.autoDispose(
  (ref) => HealthRepositoryImpl(
      ref.read(healthFactoryProvider), ref.read(userFirestoreProvider)),
);
