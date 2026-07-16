import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String? hintText;

  final String? labelText;

  final Widget? prefixIcon;

  final Widget? suffixIcon;

  final bool obscureText;

  final bool enabled;

  final bool readOnly;

  final int maxLines;

  final int? maxLength;

  final TextInputType keyboardType;

  final TextInputAction textInputAction;

  final String? Function(String?)? validator;

  final void Function(String)? onChanged;

  final VoidCallback? onTap;

  final FocusNode? focusNode;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,

      obscureText: obscureText,

      enabled: enabled,

      readOnly: readOnly,

      maxLines: obscureText ? 1 : maxLines,

      maxLength: maxLength,

      keyboardType: keyboardType,

      textInputAction: textInputAction,

      cursorColor: AppColors.primary,

      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isDark
            ? AppColors.darkTextPrimary
            : AppColors.textPrimary,
      ),

      decoration: InputDecoration(
        hintText: hintText,

        labelText: labelText,

        prefixIcon: prefixIcon,

        suffixIcon: suffixIcon,

        filled: true,

        fillColor: isDark
            ? AppColors.darkInputFill
            : AppColors.inputFill,

        counterText: "",

        hintStyle: TextStyle(
          color: isDark
              ? AppColors.darkTextHint
              : AppColors.textHint,
        ),

        labelStyle: TextStyle(
          color: isDark
              ? AppColors.darkTextSecondary
              : AppColors.textSecondary,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}