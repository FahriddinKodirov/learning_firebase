import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learning_firebase/data/auth/auth_github_repo.dart';
import 'package:learning_firebase/screen/home/home_page.dart';
import 'package:provider/provider.dart';

class GuthubLoginPage extends StatefulWidget {
  const GuthubLoginPage({Key? key}) : super(key: key);

  @override
  GuthubLoginPageState createState() => GuthubLoginPageState();
}

class GuthubLoginPageState extends State<GuthubLoginPage> {
  @override
  Widget build(BuildContext context) {
    AuthGithubViewModel authProvider = Provider.of<AuthGithubViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(color: Color(0xff203152)),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: TextButton(
                onPressed: () async {
                  authProvider.signInWithGitHub().then((isSuccess) {
                    if (isSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  }).catchError((error, stackTrace) {
                    Fluttertoast.showToast(msg: error.toString());
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) return const Color(0xffdd4b39).withOpacity(0.8);
                      return const Color(0xffdd4b39);
                    },
                  ),
                  splashFactory: NoSplash.splashFactory,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  ),
                ),
                child: const Text(
                  'Sign in with Github',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
           
          ],
        ));
  }
}
