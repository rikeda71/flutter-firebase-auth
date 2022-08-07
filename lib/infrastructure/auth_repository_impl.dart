import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_repository.dart';
import 'package:flutter_firebase_auth/domain/profile/health/steps.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._auth, this._store);

  final FirebaseAuth _auth;
  final CollectionReference<Map<String, dynamic>> _store;
  final _googleSignin = GoogleSignIn();

  @override
  Future<Profile?> signin() async {
    User? user = _auth.currentUser != null
        ? _auth.currentUser!
        : await _signInInternal();
    if (user != null) {
      final doc = await _store
          .doc(user.uid)
          .get(const GetOptions(source: Source.serverAndCache));
      if (!doc.exists) {
        _store.doc(user.uid).set({
          'name': user.displayName!,
          'email': user.email!,
          'photoUrl': user.photoURL!,
          'isSignined': false, // ユーザー情報の登録画面にいくためにサインインのステータスは false
          'gender': 0, // 未設定
          'birthday': DateTime(DateTime.now().year + 1) // これは仮で未来の日付を登録
        });
      } else {
        print(doc.data());
      }
      final profile = Profile(
        uid: user.uid,
        displayName: user.displayName!,
        email: user.email!,
        phoneNumber: user.phoneNumber != null ? user.phoneNumber! : '',
        photoUrl: user.photoURL != null ? user.photoURL! : '',
        steps: const Steps(count: 0),
      );
      return profile;
    }
    return null;
  }

  Future<User?> _signInInternal() async {
    try {
      GoogleSignInAccount? googleSigninAccount = await _googleSignin.signIn();
      if (googleSigninAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSigninAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        final user = userCredential.user;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-differenct-credentials') {
        // handle error
      } else if (e.code == 'invalid-credential') {
        // handle error
      }
    } catch (e) {
      // handle error
    }
    return null;
  }
}
