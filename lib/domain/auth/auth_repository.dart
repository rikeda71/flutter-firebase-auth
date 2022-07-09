import 'package:flutter_firebase_auth/domain/profile/profile.dart';

abstract class AuthRepository {
  Future<Profile?> signin();
}
