import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learning_firebase/view_model/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var user = FirebaseAuth.instance.currentUser;

  List list = [];

  _user() {
    if (user != null) {
      for (final providerProfile in user!.providerData) {
        list.add(providerProfile.providerId);
        list.add(providerProfile.displayName);
        list.add(providerProfile.email);
        list.add(providerProfile.uid);
      }
    }
  }

  @override
  void initState() {
    _user();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<AuthViewModel>(context, listen: false)
                      .updateUserName('fahriddin');
                },
                icon: const Icon(Icons.update)),
          ],
        ),
        body: Column(
          children: [Text(list.toString())],
        ));
  }
}
