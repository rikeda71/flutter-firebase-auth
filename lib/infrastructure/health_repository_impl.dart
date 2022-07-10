import 'package:flutter_firebase_auth/domain/profile/health/health_repository.dart';
import 'package:flutter_firebase_auth/domain/profile/health/steps.dart';
import 'package:health/health.dart';

class HealthRepositoryImpl implements HealthRepository {
  HealthRepositoryImpl(this._healthFactory);

  final HealthFactory _healthFactory;

  static const types = [
    HealthDataType.STEPS,
  ];

  @override
  Future<Steps> getSteps() async {
    final now = DateTime.now();
    final requested = await _healthFactory.requestAuthorization(types);
    if (!requested) {
      return const Steps(count: 0);
    }
    int? steps = await _healthFactory.getTotalStepsInInterval(now.subtract(const Duration(days: 1)), now);
    int count = steps ?? 0;
    return Steps(count: count);
  }
}