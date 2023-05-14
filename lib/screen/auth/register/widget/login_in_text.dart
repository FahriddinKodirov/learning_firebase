import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginInText extends StatelessWidget {
  final VoidCallback onClickSignUp;
  const LoginInText({super.key, required this.onClickSignUp});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'New User? ',
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 17,
          ),
          children: [
            TextSpan(
                style: const TextStyle(
                  color: Color(0xFF2FC354),
                  fontSize: 17,
                ),
                recognizer: TapGestureRecognizer()..onTap = onClickSignUp,
                text: 'Sign Up')
          ]),
    );
  }
}
