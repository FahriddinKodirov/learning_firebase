import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  _token()async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("FCM TOKEN:$token");
  }

  @override
  void initState() {
    _token();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}