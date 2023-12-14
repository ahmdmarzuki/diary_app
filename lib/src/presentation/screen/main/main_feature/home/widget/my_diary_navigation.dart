import 'package:diary_app/src/presentation/provider/states/home_nav/home_notifier.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDiaryNavigation extends StatelessWidget {
  const MyDiaryNavigation({
    super.key,
    required this.ref,
    required this.currentIndex,
  });

  final WidgetRef ref;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          ref
              .read(homeNavProvider.notifier)
              .onIndexChanged(0);
        },
        child: Container(
          height: 58,
          decoration: BoxDecoration(
              color: currentIndex == 0
                  ? secondaryColor
                  : primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(34),
                  topRight: const Radius.circular(34),
                  bottomRight: Radius.circular(
                      currentIndex == 0 ? 0 : 34))),
          child: Center(
            child: CostumText(
              text: "My Diary",
              color:
                  currentIndex == 0 ? blackColor : whiteColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
