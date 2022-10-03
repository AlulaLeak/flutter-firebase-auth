import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import './profile.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.person),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<ProfileScreen>(
            builder: (context) => const Profile(),
          ),
        );
      },
    );
  }
}
