import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  void getUser(username) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .snapshots();
  }

  void addUser(String? username, int age) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    notifyListeners();

    username != null
        ? users
            .add({
              'username': username, // John Doe
              'age': age // 42
            })
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"))
        : print("Username is null");
    notifyListeners();
  }
}
