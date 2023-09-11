import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: AppColors.darkBlue,
      duration: const Duration(seconds: 5),
    ),
  );
}
