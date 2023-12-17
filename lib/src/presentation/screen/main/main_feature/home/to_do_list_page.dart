import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
      ),
      child: const Center(
        child: Text('My gallery'),
      ),
    );
  }
}
