import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase_auth/ui/pages/profile/profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'firebase_options.dart';
import 'ui/pages/login/login_page.dart';

Future<void> main() async {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
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
              routes: <String, WidgetBuilder>{
                '/login': (context) => const LoginPage(),
                '/profile': (context) => const ProfilePage(),
              },
            );
          }

          // 読み込み時は真っ黒な画面を表示
          return Container(
            color: Colors.black,
          );
        });
  }
}
