import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBlue = Color(0xFF110E47);
  static const Color lightBlue = Color(0xFF0098FF);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFF777777);
  static const Color lightGrey2 = Color(0xFFAAA9B1);
  static const Color lightGrey3 = Color(0xFFE5E4EA);
  static const Color lightGrey4 = Color(0xFF9C9C9C);
  static const Color transparent = Colors.transparent;
}

class AppColorsWithOpacity {
  static Color whiteOfZero = Colors.white.withOpacity(0);
}

class AppMaterialColors {
  static const MaterialColor primarySwatch = MaterialColor(0xFF110E47, {
    50: Color(0xFFFFEBEE),
    100: Color(0xFFE5E4EA),
    200: Color(0xFF0098FF),
  });
}
