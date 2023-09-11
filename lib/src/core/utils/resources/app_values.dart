import 'package:flutter/material.dart';

class AppMargin {
  static const double m6 = 6.0;
  static const double m8 = 8.0;
  static const double m10 = 10.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
  static const double m22 = 22.0;
  static const double m24 = 24.0;
  static const double m26 = 26.0;
  static const double m28 = 28.0;
  static const double m30 = 30.0;
  static const double m32 = 32.0;
}

class AppPadding {
  static const double p0 = 0.0;
  static const double p4 = 4.0;
  static const double p5 = 5.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p22 = 22.0;
  static const double p24 = 24.0;
  static const double p26 = 26.0;
  static const double p28 = 28.0;
  static const double p30 = 30.0;
  static const double p32 = 32.0;
  static const double p50 = 50.0;
  static const double p80 = 80.0;
  static const double p90 = 90.0;
  static const double p100 = 100.0;
}

class AppSize {
  static const double s0_15 = 0.15;
  static const double s0 = 0;
  static const double s1 = 1;
  static const double s1_5 = 1.5;
  static const double s2 = 2;
  static const double s3 = 3;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s25 = 25.0;
  static const double s26 = 26.0;
  static const double s30 = 30.0;
  static const double s45 = 45.0;
  static const double s50 = 50.0;
  static const double s60 = 60.0;
  static const double s85 = 85.0;
  static const double s120 = 120.0;
  static const double s130 = 130.0;
  static const double s170 = 170.0;
  static const double s145 = 145.0;
  static const double s215 = 215.0;
  static const double s280 = 280.0;
  static const double s300 = 300.0;
  static const double s335 = 335.0;
}

class AppCounts {
  static const int c1 = 1;
  static const int c2 = 2;
  static const int c3 = 3;
  static const int c4 = 4;
}

class AppElevation {
  static const double e0 = 0.0;
  static const double e1 = 1.0;
  static const double e1_5 = 1.5;
  static const double e2 = 2.0;
}

class AppEdgeInsetsPaddings {
  static const EdgeInsetsGeometry registerPadding = EdgeInsets.only(
      top: AppPadding.p90, right: AppPadding.p20, left: AppPadding.p20);
  static const EdgeInsetsGeometry loginPadding =
      EdgeInsets.only(right: AppPadding.p20, left: AppPadding.p20);
  static const EdgeInsetsGeometry textFormFieldPadding = EdgeInsets.only(
      left: AppPadding.p24, bottom: AppPadding.p5, top: AppPadding.p5);

  static const EdgeInsetsGeometry appBarLeadingPadding =
      EdgeInsets.only(left: AppPadding.p24);
  static const EdgeInsetsGeometry appBarActionsPadding =
      EdgeInsets.only(right: AppPadding.p24);

  static const EdgeInsetsGeometry appBarLeadingIconPadding =
      EdgeInsets.all(AppPadding.p4);

  static const EdgeInsetsGeometry tvShowListViewPadding =
      EdgeInsets.symmetric(horizontal: AppPadding.p24);

  static const EdgeInsetsGeometry tvShowListViewContainerPadding =
      EdgeInsets.only(right: AppPadding.p12);

  static const EdgeInsetsGeometry movieListViewPadding =
      EdgeInsets.symmetric(horizontal: AppPadding.p24);

  static const EdgeInsetsGeometry movieListViewContainerPadding =
      EdgeInsets.only(bottom: AppPadding.p12);

  static const EdgeInsetsGeometry defaultDetailsWidget =
      EdgeInsets.all(AppPadding.p24);

  static const EdgeInsetsGeometry defaultRelatedMoviesWidget =
      EdgeInsets.symmetric(horizontal: AppPadding.p24);
}

class AppEdgeInsetsMargins {
  static const EdgeInsetsGeometry customCategoryMargin = EdgeInsets.fromLTRB(
      AppMargin.m24, AppMargin.m24, AppMargin.m24, AppMargin.m12);
}

class AppDurations {
  static const Duration milliSeconds_500 = Duration(milliseconds: 500);
}
