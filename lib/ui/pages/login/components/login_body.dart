import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/di/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginBody extends HookConsumerWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: _buildButton(context, ref),
    );
  }

  Widget _buildButton(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(authStateNotifierProvider.notifier);

    void onPressed() async {
      notifier.signIn().whenComplete(() {
        Navigator.of(context).pushNamed('/profile');
      });
    }

    return Container(
      color: Colors.white,
      margin: const EdgeInsetsDirectional.all(10.0),
      child: Column(
        children: [
          const Text('ボタンを押してログインしてください'),
          FloatingActionButton(
            onPressed: onPressed,
            tooltip: 'Login',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ],
      ),
    );
  }
}
