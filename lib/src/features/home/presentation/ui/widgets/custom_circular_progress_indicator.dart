import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.darkBlue),
    );
  }
}
