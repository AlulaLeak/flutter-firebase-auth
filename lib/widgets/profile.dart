import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      actions: [
        SignedOutAction((context) {
          Navigator.of(context).pop();
        })
      ],
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Image.asset('placeholder.jpg', scale: 1),
        ),
        const Divider(),
      ],
    );
  }
}
