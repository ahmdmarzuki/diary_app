import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class MoodBar extends StatelessWidget {
  const MoodBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset('assets/icon_sad.png'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset('assets/icon_neutral.png'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset('assets/icon_happy.png'),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: primaryDarkColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Image.asset('assets/icon_laugh.png'),
          ),
        ),
      ],
    );
  }
}
