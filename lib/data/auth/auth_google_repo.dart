import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthGoogleViewModel with ChangeNotifier {
 final GoogleSignIn googleSignIn;


AuthGoogleViewModel({required this.googleSignIn});

Future<bool> signInWithGoogle() async {
  notifyListeners();
  
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

if (googleUser != null) {
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
    await FirebaseAuth.instance.signInWithCredential(credential);
  return true;
} else {
   Fluttertoast.showToast(msg: "Sign in canceled");
      notifyListeners();
      return false;
   }  
  }
}