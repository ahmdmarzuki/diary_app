import 'package:diary_app/src/presentation/screen/auth/register_screen.dart';
import 'package:diary_app/src/presentation/screen/home/home_screen.dart';
import 'package:diary_app/src/presentation/screen/home/main_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diary App',
      home: RegisterScreen(),
    );
  }
}
