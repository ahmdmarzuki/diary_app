import 'package:diary_app/src/core/provider/write_diary_provider.dart';
import 'package:diary_app/src/presentation/screen/diary/write_diary_screen.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddDiaryButton extends ConsumerWidget {
  const AddDiaryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async{
        ref.read(writeDiaryModelProvider).clear();
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WriteDiaryScreen(),
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
