import 'package:flutter/material.dart';

import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.keyboardType,
    this.suffixIcon,
    this.border,
    this.onTap,
    this.validator,
    this.controler,
    required this.obscureText,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final InputBorder? border;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextEditingController? controler;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.black,
      style: AppTextStyles.black16w400Roboto,
      controller: controler,
      validator: validator,
      onTap: onTap,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.purple,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon,
        helperText: helperText,
        helperStyle: AppTextStyles.gray12w400Roboto,
        labelText: labelText,
        alignLabelWithHint: true,
        errorStyle: AppTextStyles.red12w400Roboto,
        hintText: hintText,
        hintStyle: AppTextStyles.gray16w400Roboto,
      ),
    );
  }
}