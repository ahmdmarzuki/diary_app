import 'package:diary_app/values/costum_text.dart';
import 'package:diary_app/values/theme.dart';
import 'package:flutter/material.dart';

class WeatherIndicator extends StatelessWidget {
  const WeatherIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset('assets/icon_rain.png'),
        ),
        const SizedBox(width: 20),
        CostumText(
          text: "25",
          color: secondaryColor,
          fontSize: 28,
        ),
        const SizedBox(width: 8),
        CostumText(
          text: "°",
          color: secondaryColor,
          fontSize: 28,
        ),
        const SizedBox(width: 8),
        CostumText(
          text: "C",
          color: secondaryColor,
          fontSize: 28,
        ),
      ],
    );
  }
}
