import 'package:diary_app/src/presentation/screen/diary/widget/diary_card.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class MyDiary extends StatelessWidget {
  const MyDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(right: defaultMargin, left: defaultMargin, top: 80),
      decoration: BoxDecoration(
        color: secondaryColor,
      ),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 12);
        },
        itemBuilder: (BuildContext context, int index) {
          return DiaryCard(
            title: "Title",
            content: "Subtitle",
            date: "12/12/23",
          );
        },
      ),
    );
  }
}
