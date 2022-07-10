import 'package:flutter_firebase_auth/domain/profile/health/steps.dart';

abstract class HealthRepository {
  Future<Steps> getSteps();
}
