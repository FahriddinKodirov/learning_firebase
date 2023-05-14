import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CloudDatabsePage extends StatefulWidget {
  const CloudDatabsePage({super.key});

  @override
  State<CloudDatabsePage> createState() => _CloudDatabsePageState();
}

class _CloudDatabsePageState extends State<CloudDatabsePage> {
  var db = FirebaseFirestore.instance;

// -------------------- Map One  Data -------------------
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

// -------------------- Map Two Data -------------------

  final user2 = <String, dynamic>{
    "first": "Alan",
    "middle": "Mathison",
    "last": "Turing",
    "born": 1912
  };

// -------------------- Map Three Data -------------------

  final city = <String, String>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA"
  };

// -------------------- Map Four Data -------------------

  var docData = {
    "stringExample": "Hello world!",
    "booleanExample": true,
    "numberExample": 3.14159265,
    "dateExample": Timestamp.now(),
    "listExample": [1, 2, 3],
    "nullExample": null
  };

  final nestedData = {
    "a": 5,
    "b": true,
  };

  _addUser() {
    docData["objectExample"] = nestedData;
    db
        .collection("data")
        .doc("one")
        .set(docData)
        .onError((e, _) => print("Error writing document: $e"));
  }

  _user() {
    db.collection("users").add(user2).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  _delete() {
    db.collection("users").doc('0R4v2IykyGJTBkbfemc8').delete().then(
          (doc) => print("Document deleted"),
          onError: (e) => print("Error updating document $e"),
        );
  }

  _createUser() {
    db
        .collection("cities")
        .doc("LA")
        .set(city)
        .onError((e, _) => print("Error writing document: $e"));
  }

  _readData() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  _updateData() {
    final washingtonRef = db.collection("cities").doc("LA");
    washingtonRef.update({"country": "UZB"}).then(
        (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));
  }

  _getData() {
    db.collection("data").where("first", isEqualTo: 'Alan').get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  _listenData() {
    db
        .collection("cities")
        .where("state", isEqualTo: "CA")
        .snapshots()
        .listen((event) {
      final cities = [];
      for (var doc in event.docs) {
        cities.add(doc.data()["name"]);
      }
      print("cities in CA: $cities");
    });
  }

  @override
  void initState() {
    _getData();
    _delete();
    _updateData();
    _addUser();
    // _createUser();
    _user();
    _readData();
    _listenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Container(
        color: CupertinoColors.activeOrange,
      ),
    );
  }
}
