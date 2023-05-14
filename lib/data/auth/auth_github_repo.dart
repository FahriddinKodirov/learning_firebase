import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthGithubViewModel with ChangeNotifier {

Future<bool> signInWithGitHub() async {
  GithubAuthProvider githubProvider = GithubAuthProvider();

  if (githubProvider != null) {
   await FirebaseAuth.instance.signInWithProvider(githubProvider);
   return true;
  } else {
   Fluttertoast.showToast(msg: "Sign in canceled");
      notifyListeners();
      return false;
   }  
   
}
}







