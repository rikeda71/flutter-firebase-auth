import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth/domain/auth/auth_repository.dart';
import 'package:flutter_firebase_auth/domain/profile/profile.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _auth = FirebaseAuth.instance;
  final _googleSignin = GoogleSignIn();

  @override
  Future<Profile?> signin() async {
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
        if (user != null) {
          final profile = Profile(
              displayName: user.displayName!,
              email: user.email!,
              phoneNumber: user.phoneNumber != null ? user.phoneNumber! : '',
              photoUrl: user.photoURL != null ? user.photoURL! : '');
          return profile;
        }
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
    return null;
  }
}
