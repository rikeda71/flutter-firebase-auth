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

    return Container(
        key: const Key('profile'),
        child: Center(
            child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('プロフィール',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  profile.photoUrl != ''
                      ? Image.network(profile.photoUrl)
                      : const Padding(padding: EdgeInsets.all(8.0)),
                  Text('name: ${profile.displayName}'),
                  Text('email: ${profile.email}'),
                  Text('phoneNumber: ${profile.phoneNumber}'),
                ],
              ),
            )
          ],
        )));
    //     child: Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     const Text('プロフィール'),
    //     Text('name: ${profile.displayName}'),
    //     Text(profile.email),
    //     Text(profile.phoneNumber),
    //     Text(profile.photoUrl)
    //   ],
    // )),
    // );
  }
}
