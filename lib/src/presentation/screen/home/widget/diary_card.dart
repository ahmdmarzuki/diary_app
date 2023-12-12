import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class DiaryCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  const DiaryCard({
    super.key, required this.title, required this.content, required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      height: 100,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CostumText(
                  text: title,
                  color: blackColor,
                  fontSize: 18,
                ),
                CostumText(
                  text:
                      content,
                  color: blackColor,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          CostumText(text: date, color: blackColor)
        ],
      ),
    );
  }
}
