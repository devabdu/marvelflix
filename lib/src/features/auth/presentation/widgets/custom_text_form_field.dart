import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyBoardType;
  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.keyBoardType,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.readOnly = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: keyBoardType,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        //errorText: 'Error',
        suffixIcon: suffixIcon,
      ),
    );
  }
}
