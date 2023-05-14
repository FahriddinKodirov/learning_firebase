import 'package:flutter/cupertino.dart';
import 'package:learning_firebase/data/auth/auth_email_password_repo.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  AuthViewModel({required AuthRepository authRepository}):
     _authRepository = authRepository;

 signIn({required String email, required String password}) {
  _authRepository.signIn(email: email, password: password);
 } 

 signUp({required String email, required String password}) =>
  _authRepository.signUp(email: email, password: password);
  
   updateUserName(word) => _authRepository.updateUserName(word);
}

