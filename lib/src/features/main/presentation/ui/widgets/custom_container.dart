import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

class CustomContainer extends StatelessWidget {
  final String nameOfCategory;
  final VoidCallback pressSeeMore;

  const CustomContainer({
    Key? key,
    required this.nameOfCategory,
    required this.pressSeeMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nameOfCategory,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.15,
              color: AppColors.darkBlue,
            ),
          ),
          GestureDetector(
            onTap: pressSeeMore,
            child: Container(
              width: 60,
              height: 25,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.lightGrey2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSize.s14),
                ),
              ),
              child: Center(
                child: Text(
                  AppStrings.seeMore,
                  style: GoogleFonts.mulish(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
