import 'package:flutter/material.dart';

class CustomSingleChildScrollViewVertical extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  
  const CustomSingleChildScrollViewVertical(
      {super.key, this.padding, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      padding: padding,
      child: Column(
        children: children,
      ),
    );
  }
}
