import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';

ThemeData appLightTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.darkBlue,
    primaryColorLight: AppColors.darkBlue,
    disabledColor: AppColors.lightGrey,
    splashColor: AppColors.darkBlue,
  );
}
