import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_font.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

class CustomHeadLineText extends StatelessWidget {
  final String headLine;
  const CustomHeadLineText({Key? key, required this.headLine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      headLine,
      style: GoogleFonts.merriweather(
        fontSize: AppSize.s18,
        fontWeight: AppFontWeight.extraBold,
        letterSpacing: AppSize.s0_15,
        color: AppColors.darkBlue,
      ),
    );
  }
}
