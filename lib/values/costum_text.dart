import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CostumText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? textOverflow;
  const CostumText({
    super.key,
    required this.text,
    required this.color,
    this.fontSize,
    this.fontWeight,
    this.textOverflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize, fontWeight: fontWeight, color: color),
      overflow: textOverflow,
    );
  }
}
