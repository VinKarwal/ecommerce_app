import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/homepage.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = '/';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHomePage();
            
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
