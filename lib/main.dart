import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // エラー時は真っ白な画面を表示
            return Container(color: Colors.white);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Firebase Auth App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const LoginPage(),
            );
          }

          // 読み込み時は真っ黒な画面を表示
          return Container(
            color: Colors.black,
          );
        });
  }
}
