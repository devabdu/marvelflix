import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';

class CustomRichText extends StatelessWidget {
  final String mainText;
  final String highlightText;
  final Widget nextWidget;
  final double? fontSize;
  final Color? colorMainText;
  final Color? colorhighlightText;
  final TextDecoration? highlightTextDecoration;

  const CustomRichText({
    super.key,
    required this.mainText,
    required this.highlightText,
    required this.nextWidget,
    this.fontSize,
    this.colorMainText,
    this.colorhighlightText = AppColors.darkBlue,
    this.highlightTextDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: GoogleFonts.workSans(
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w400,
          color: colorMainText ?? AppColors.black,
        ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Future.delayed(Duration.zero, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextWidget),
                  );
                });
              },
            text: highlightText,
            style: GoogleFonts.workSans(
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.w700,
              color: colorhighlightText ?? AppColors.darkBlue,
              decoration: highlightTextDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
