import 'package:flutter/material.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

class CustomSizedBoxMovie extends StatelessWidget {
  final Widget child;
  const CustomSizedBoxMovie({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s300,
      child: child,
    );
  }
}
