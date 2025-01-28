import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<User?> login(String method, {String? email, String? password}) async {
  try {
    if (method == 'google') {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      Logger().i("ok 1");

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      Logger().i("ok 2");

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      Logger().i("ok 3");
      Logger().i(credential);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      Logger().i("ok 4");

      Logger().i(userCredential);

      Logger().i("ok 5");

      Logger().i("User login was successfull");

      return userCredential.user;
    } else if (method == 'email') {
      return await loginWithEmailAndPassword(email!, password!);
    } else {
      if (kDebugMode) {
        Logger().e("GOOGLE: login: Method is neither google or email...");
      }
    }
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) Logger().e("GOOGLE: login: $e");
    return null;
  }
  return null;
}

Future<User?> registerWithEmailAndPassword(
    String email, String password) async {
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) Logger().e("GOOGLE: registerWithEmailAndPassword: $e");
    return null;
  }
}

Future<User?> loginWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } on FirebaseAuthException catch (e) {
    if (kDebugMode) Logger().e("GOOGLE: loginWithEmailAndPassword: $e");
    return null;
  }
}

Future<bool> signOut() async {
  try {
    await _auth.signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}
