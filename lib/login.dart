import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final title = 'Login Page';
  final login = Login();

  User? _user;

  void _setUser(User user) {
    setState(() {
      _user = user;
    });
  }

  void _clickLoginButton() async {
    User? user = await login.signin();
    if (user != null) {
      _setUser(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              _user?.displayName != null ? _user!.toString() : '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickLoginButton,
        tooltip: 'Login',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Login {
  final _auth = FirebaseAuth.instance;
  final _googleSignin = GoogleSignIn();

  signin() async {
    try {
      GoogleSignInAccount? googleSigninAccount = await _googleSignin.signIn();
      log(googleSigninAccount.toString());
      if (googleSigninAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSigninAccount.authentication;
        log(googleSignInAuthentication.toString());
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        log(credential.toString());

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        return userCredential.user;
      }
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-differenct-credentials') {
        // handle error
      } else if (e.code == 'invalid-credential') {
        // handle error
      }
    } catch (e) {
      // handle error
    }
  }
}
