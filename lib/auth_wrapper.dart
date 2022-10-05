import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './widgets/signin_page.dart';
import 'home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignInPage();
        }
        return HomeScreen();
      },
    );
  }
}
