import 'package:diary_app/src/core/provider/states/home_nav/home_notifier.dart';
import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToDoListNavigation extends StatelessWidget {
  const ToDoListNavigation({
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
              .onIndexChanged(1);
        },
        child: Container(
          height: 58,
          decoration: BoxDecoration(
            color: currentIndex == 0
                ? primaryColor
                : secondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(34),
              topRight: const Radius.circular(34),
              bottomLeft:
                  Radius.circular(currentIndex == 1 ? 0 : 34),
            ),
          ),
          child: Center(
            child: CostumText(
              text: "My Gallery",
              color:
                  currentIndex == 1 ? blackColor : whiteColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
