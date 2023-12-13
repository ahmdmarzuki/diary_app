import 'package:diary_app/src/presentation/screen/auth/profile_form.dart';
import 'package:diary_app/src/presentation/screen/auth/register_screen.dart';
import 'package:diary_app/src/presentation/screen/home/main_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    // bool newUser = false;
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // jika user sudah pernah login
          if (snapshot.hasData) {
            return const MainNav();
          }

          // jika user belum pernah login
          else {
            return const RegisterScreen();
          }
        },
      ),
    );
  }
}
