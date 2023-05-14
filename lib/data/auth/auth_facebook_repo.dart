import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthFacebookViewModel with ChangeNotifier {

Future<bool> signInWithFacebook() async {
  notifyListeners();
  final LoginResult loginResult = await FacebookAuth.instance.login();
   
   if (loginResult != null) {
     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
     await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

   return true;

  } else {
   Fluttertoast.showToast(msg: "Sign in canceled");
      notifyListeners();
      return false;
   }  
   
}
}