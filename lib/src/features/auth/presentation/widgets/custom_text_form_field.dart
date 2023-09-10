import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marvelflix/src/core/utils/resources/app_font.dart';
import 'package:marvelflix/src/core/utils/resources/app_values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyBoardType;
  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final bool readOnly;
  final String? Function(String?)? validator;

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
    this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s45,
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyBoardType,
        readOnly: readOnly,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s12))),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.workSans(
              fontSize: AppFontSize.s22,
              fontWeight: AppFontWeight.regular,
            ),
            labelText: labelText,
            //errorText: 'Error',
            suffixIcon: suffixIcon,
            contentPadding: AppEdgeInsetsPaddings.textFormFieldPadding),
        validator: validator,
      ),
    );
  }
}
