import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'providers/number_provider.dart';
import 'providers/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  User? user = FirebaseAuth.instance.currentUser;

  // final Stream<QuerySnapshot> usersStream =
  // FirebaseFirestore.instance.collection('users').where('username', isEqualTo: user).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(children: <Widget>[
              ElevatedButton(
                child: const Text('Show Modal Bottom Sheet'),
                onPressed: () {
                  print(user?.displayName);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: const [
                          ListTile(
                            leading: Icon(Icons.share),
                            title: Text('Share'),
                          ),
                          ListTile(
                            leading: Icon(Icons.copy),
                            title: Text('Copy Link'),
                          ),
                          ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<NumberProvider>().increment();
                  },
                  child: Text(
                      "Add Item to Cart ${context.watch<NumberProvider>().count}")),
              ElevatedButton(
                  onPressed: () {
                    context.read<UserProvider>().addUser(user?.displayName, 35);
                  },
                  child: const Text("Add user")),
            ]),
          );
        },
      ),
    );
  }
}
