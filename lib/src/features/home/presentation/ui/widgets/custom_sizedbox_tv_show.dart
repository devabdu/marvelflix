import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

class CustomSizedBoxTvShow extends StatelessWidget {
  final Widget child;
  const CustomSizedBoxTvShow({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s280,
      child: child,
    );
  }
}
