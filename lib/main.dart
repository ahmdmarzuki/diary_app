import 'package:diary_app/firebase_options.dart';
import 'package:diary_app/src/presentation/screen/auth/auth_gate.dart';
import 'package:diary_app/src/presentation/screen/auth/register_screen.dart';
import 'package:diary_app/src/presentation/screen/auth/splash_screen.dart';
import 'package:diary_app/src/presentation/screen/home/home_screen.dart';
import 'package:diary_app/src/presentation/screen/home/main_nav.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diary App',
      home: AuthGate(),
    );
  }
}
