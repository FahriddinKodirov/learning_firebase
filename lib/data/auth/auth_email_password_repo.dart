import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_firebase/utils/my_utils.dart';

class AuthRepository {
 final FirebaseAuth auth;

AuthRepository({required this.auth});

// ----------------- yaratish --------------------------------------------
Future<void> signUp({required String email,required String password}) async {

  try {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
}
// ----------------- royhatga kiritish --------------------------------
Future<void> signIn ({required String email, required String password}) async {

  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
}

// ----------------- name kiritish --------------------------------

Future<void> updateUserName(word) async {

  try {
    await auth.currentUser?.updateDisplayName(word);
  } on FirebaseAuthException catch (error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
}

}

// -------------------------------------------------------------------------------

