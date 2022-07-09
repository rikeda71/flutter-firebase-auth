import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/di/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePageBody extends HookConsumerWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildContents(context, ref);
  }

  Widget _buildContents(BuildContext context, WidgetRef ref) {
    final profile =
        ref.watch(authStateNotifierProvider.select((value) => value));

    return Scaffold(
      key: const Key('profile'),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('プロフィール'),
          Text('name: ${profile.displayName}'),
          Text(profile.email),
          Text(profile.phoneNumber),
          Text(profile.photoUrl)
        ],
      )),
    );
  }
}
