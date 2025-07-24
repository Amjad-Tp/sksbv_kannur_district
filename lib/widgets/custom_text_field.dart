import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool? obscureText;
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.readOnly,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: blueNormal,
      controller: controller,
      style: const TextStyle(fontSize: 13, fontWeight: fw500),
      readOnly: readOnly ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 20, color: greyColor)
            : null,
        labelStyle: TextStyle(
          color: blackColor.withValues(alpha: .7),
          fontSize: 13,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: royalBlue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: royalBlue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Required*';
            }
            return null;
          },
    );
  }
}
