import 'package:budget/src/shared/constants/app_colors.dart';
import 'package:budget/src/shared/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.suffixIcon,
    this.border,
    this.helperText,
    this.onTap,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText = false;
  final InputBorder? border;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: AppColors.black,
      style: AppTextStyles.black16w400Roboto,
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
      ),
    );
  }
}
