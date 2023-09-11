import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: AppColors.transparent,
    elevation: AppElevation.e0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkBlue),
      ),
    ),
  );
  showDialog(
    barrierColor: AppColorsWithOpacity.whiteOfZero,
    barrierDismissible: false,
    context: context,
    builder: (context) => alertDialog,
  );
}
