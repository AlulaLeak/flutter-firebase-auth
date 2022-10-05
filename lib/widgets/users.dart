import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Users extends StatelessWidget {
  Users({super.key});

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong: ${snapshot.error.toString()}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            final data = snapshot.requireData;

            return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return Text(
                      "My name is ${data.docs[index]['username']} and I am ${data.docs[index]['age']} years old.");
                });
          },
        ),
      ),
    );
  }
}
