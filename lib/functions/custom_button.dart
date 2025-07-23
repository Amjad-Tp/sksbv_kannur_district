import 'package:flutter/material.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

TextButton buildThemeTextButton({
  required VoidCallback function,
  required String name,
}) {
  return TextButton(
    onPressed: function,
    style: TextButton.styleFrom(
      backgroundColor: blueNormal,
      foregroundColor: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
    ),
    child: const Text('Register'),
  );
}
