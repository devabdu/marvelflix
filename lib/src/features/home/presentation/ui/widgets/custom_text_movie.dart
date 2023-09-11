// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_font.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

class CustomTextMovie extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  const CustomTextMovie({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mulish(
        fontSize: fontSize ?? AppSize.s14,
        fontWeight: fontWeight ?? AppFontWeight.regular,
        letterSpacing: AppSize.s0_15,
        color: textColor ?? AppColors.black,
      ),
      maxLines: 2,
    );
  }
}
