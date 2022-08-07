// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqsGwv5FIlgQajuBM2tJzaSkBIVPy_hBw',
    appId: '1:514826886102:android:e6e7544490c446b1f12277',
    messagingSenderId: '514826886102',
    projectId: 'shikoku-ohenro',
    storageBucket: 'shikoku-ohenro.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBYYoCWwM5RYj-RYJbEfDG7XoQneEFRVNg',
    appId: '1:514826886102:ios:3bf41e55f8f93d50f12277',
    messagingSenderId: '514826886102',
    projectId: 'shikoku-ohenro',
    storageBucket: 'shikoku-ohenro.appspot.com',
    androidClientId: '514826886102-q324o6fsalf6j49nv17b9254tiuqg592.apps.googleusercontent.com',
    iosClientId: '514826886102-7vub50d72pi3qgknd5g1tsfjcpltk06b.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseAuth',
  );
}
