import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learning_firebase/data/auth/auth_facebook_repo.dart';
import 'package:learning_firebase/data/auth/auth_github_repo.dart';
import 'package:learning_firebase/data/auth/auth_google_repo.dart';
import 'package:learning_firebase/data/auth/auth_number_repo.dart';
import 'package:learning_firebase/data/auth/auth_email_password_repo.dart';
import 'package:learning_firebase/screen/auth/auth_page.dart';
import 'package:learning_firebase/screen/notification/notification_page.dart';
import 'package:learning_firebase/screen/storage/storage_page.dart';
import 'package:learning_firebase/view_model/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(
    
  );
  
  runApp(MultiProvider(providers: [
    Provider(
        create: (context) => AuthViewModel(
            authRepository: AuthRepository(auth: FirebaseAuth.instance))),
    ChangeNotifierProvider(
        create: (context) => AuthNumberViewModel(
            auth: FirebaseAuth.instance)),
    ChangeNotifierProvider(
        create: (context) => AuthGoogleViewModel(
            googleSignIn: GoogleSignIn(),
            )),
    ChangeNotifierProvider(
        create: (context) => AuthFacebookViewModel()),
    ChangeNotifierProvider(
        create: (context) => AuthGithubViewModel()),
    
  ], 
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          return const NotificationPage();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
