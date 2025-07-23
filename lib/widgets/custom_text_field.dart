import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? readOnly;
  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: blueNormal,
      controller: controller,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(
          color: blackColor.withValues(alpha: .7),
          fontSize: 13,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: royalBlue, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: royalBlue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
