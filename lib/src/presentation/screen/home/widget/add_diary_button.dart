import 'package:diary_app/src/presentation/screen/diary/add_diary_screen.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class AddDiaryButton extends StatelessWidget {
  const AddDiaryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddDiaryScreen(),
          ),
        );
      },
      child: Container(
        height: 96,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: primaryColor),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CostumText(
                    text: "Add Diary",
                    color: whiteColor,
                    fontSize: 18,
                  ),
                  CostumText(
                    text: "Mulai nulis sekarang",
                    color: whiteColor,
                    fontSize: 14,
                  )
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/image_reading.png',
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
