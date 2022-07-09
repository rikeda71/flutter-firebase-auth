import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/di/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginBody extends HookConsumerWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: _buildButton(context, ref),
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
        child: Center(
            child: Stack(children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 160.0)),
              const Text('ボタンを押してログインしてください'),
              const Padding(padding: EdgeInsets.only(top: 16.0)),
              SignInButton(Buttons.Google, onPressed: onPressed),
            ],
          ),
        ])));
  }
}
