import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_icons.dart';
import 'package:marvelflix/src/core/utils/resources/app_strings.dart';

class AppLists {
  static const List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Icon(AppIcons.movie), label: AppStrings.emptyString),
    BottomNavigationBarItem(
        icon: Icon(AppIcons.tvShow), label: AppStrings.emptyString),
    BottomNavigationBarItem(
        icon: Icon(AppIcons.bookMark), label: AppStrings.emptyString),
  ];
}
