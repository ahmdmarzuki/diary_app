import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class AddGalleryButton extends StatelessWidget {
  const AddGalleryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  text: "Add Gallery",
                  color: whiteColor,
                  fontSize: 18,
                ),
                CostumText(
                  text: "Capture every moment",
                  color: whiteColor,
                  fontSize: 14,
                )
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              'assets/image_camp.png',
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
