import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RealTimePage extends StatefulWidget {
  const RealTimePage({super.key});

  @override
  State<RealTimePage> createState() => _RealTimePageState();
}

class _RealTimePageState extends State<RealTimePage> {
  
  DatabaseReference ref = FirebaseDatabase.instance.ref('user/123');
  DatabaseReference postListRef = FirebaseDatabase.instance.ref("posts");

  

  @override
  void initState() {
    connected();
    userData();
    super.initState();
  }

  userData() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('user/123').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }

  connected() {
    final connectedRef = FirebaseDatabase.instance.ref(".info/connected");
    connectedRef.onValue.listen((event) {
      final connected = event.snapshot.value as bool? ?? false;
      if (connected) {
        debugPrint("Connected.");
      } else {
        debugPrint("Not connected.");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.set({
                    "name": "John",
                    "age": 18,
                    "address": {"line1": "100 Mountain View"}
                  });
                },
                child: const Text('accept')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.update({
                    "name": "usuf",
                    "age": 18,
                    "address": {"line1": "100 Mountain View"}
                  });
                },
                child: const Text('update')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.update({
                    "name": "John",
                    "123/age": 22,
                    "address": {"line1": "100 Mountain View"}
                  });
                },
                child: const Text('update/123')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  ref.remove();
                },
                child: const Text('delete')),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  DatabaseReference newPostRef = postListRef.push();
                  newPostRef.set('value');
                },
                child: const Text('push')),
          ),
        ],
      ),
    );
  }
}
