import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/controller/text_field_controller.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final String? prefixText;
  final TextCapitalization? capitalization;
  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.readOnly,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.obscureText = false,
    this.onChanged,
    this.maxLength,
    this.prefixText,
    this.capitalization,
  });

  @override
  Widget build(BuildContext context) {
    final textFieldController = Get.find<TextFieldController>();
    return obscureText
        ? Obx(() => _buildTextField(textFieldController))
        : _buildTextField(textFieldController);
  }

  TextFormField _buildTextField(TextFieldController textFieldController) {
    return TextFormField(
      cursorColor: blueNormal,
      controller: controller,
      style: const TextStyle(fontSize: 13, fontWeight: fw500),
      readOnly: readOnly ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ? textFieldController.obscureText.value : false,
      onChanged: onChanged,
      maxLength: maxLength,
      textCapitalization: capitalization ?? TextCapitalization.none,
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
        suffixIcon: obscureText
            ? IconButton(
                icon: Icon(
                  textFieldController.obscureText.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: blackColor,
                  size: 20,
                ),
                onPressed: textFieldController.toggleVisibility,
              )
            : null,
        hintStyle: const TextStyle(color: greyColor),
        prefixText: prefixText,
        prefixStyle: const TextStyle(color: lightBlackColor, fontSize: 12),
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
