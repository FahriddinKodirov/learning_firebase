import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_firebase/screen/home/home_page.dart';
import 'package:learning_firebase/utils/my_utils.dart';

class AuthNumberViewModel extends ChangeNotifier  {
 final FirebaseAuth auth;

AuthNumberViewModel({required this.auth});

var authCredential;
bool spinnerLoading = false;
String? verificationIDFromFirebase;
PhoneVerificationState currentState =
      PhoneVerificationState.SHOW_PHONE_FORM_STATE;

// ----------------- yaratish --------------------------------------------
Future<void> signUpWithNumber({required String number,context}) async {
  spinnerLoading = true;
  notifyListeners();
  try {
    await FirebaseAuth.instance.verifyPhoneNumber(
     phoneNumber: number,
     verificationCompleted: (PhoneAuthCredential credential) async {
      spinnerLoading = false;
      notifyListeners();
      print('-------------- $credential');
      await auth.signInWithCredential(credential);},
     verificationFailed: (FirebaseAuthException e) {
      spinnerLoading = true;
      notifyListeners();
     },
     codeSent: (String verificationId, int? resendToken) {
      spinnerLoading = false;
      currentState = PhoneVerificationState.SHOW_OTP_FORM_STATE;
      verificationIDFromFirebase = verificationId;
      notifyListeners();
     },
     codeAutoRetrievalTimeout: (String verificationId) {},
     
);
  } on FirebaseAuthException catch (error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
 }

 Future<void> verifyOTPButton({required String opt,context}) async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationIDFromFirebase!,
        smsCode: opt
      );
  try {
      spinnerLoading = true;
    notifyListeners();
    final  authCredential = await auth.signInWithCredential(phoneAuthCredential);
      spinnerLoading = false;
    notifyListeners();
    if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
  } on FirebaseAuthException catch (error) {
      spinnerLoading = false;
    notifyListeners();
    MyUtils.getMyToast(message: error.message.toString());
  }
}
}


enum PhoneVerificationState {SHOW_PHONE_FORM_STATE, SHOW_OTP_FORM_STATE}
