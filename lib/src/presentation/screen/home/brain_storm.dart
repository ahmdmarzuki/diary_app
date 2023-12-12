import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class BrainStormScreen extends StatelessWidget {
  const BrainStormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CostumText(
          text: "Brain Storm Screen",
          color: blackColor,
          fontSize: 30,
        ),
      ),
    );
  }
}
