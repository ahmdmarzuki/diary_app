import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: blackColor.withOpacity(.05)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CostumText(text: "See All", color: blackColor, fontSize: 22,fontWeight: light,),
                  SizedBox(width: defaultMargin)
                ],
              ),
        ),
        Positioned(
          // height: 100,
          // right: -200,
          // left: 0,
          bottom: -30,
            child: Image.asset(
          'assets/image_searching.png',
          width: 110,
        ))
      ],
    );
  }
}
