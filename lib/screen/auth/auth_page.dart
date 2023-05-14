import 'package:flutter/cupertino.dart';
import 'package:learning_firebase/screen/auth/register/login_page.dart';
import 'package:learning_firebase/screen/auth/register/sign_up_page.dart';

class AuthPage extends StatefulWidget {
   const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogged = true;
  

  @override
  Widget build(BuildContext context) {
    return isLogged? 
           LoginPage(onClickSignUp: swichAuthPages):
           SignUpPage(onClickSignIp: swichAuthPages,);
  }

  void swichAuthPages() {
    setState(() {
      isLogged = !isLogged;
    });
  }
}