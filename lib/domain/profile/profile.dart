import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String displayName,
    required String email,
    required String phoneNumber,
    required String photoUrl,
  }) = _Profile;
}
