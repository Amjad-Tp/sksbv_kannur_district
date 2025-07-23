import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

void alertWithBackgroundBlur({
  required String title,
  required Widget widget,
  required VoidCallback function,
  VoidCallback? backButtonFunction,
  required String buttonName,
  String? cancelButton,
}) async {
  Get.dialog(
    Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(),
        ),
        Center(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            content: widget,
            actions: [
              // Cancel button
              TextButton(
                onPressed: () {
                  if (backButtonFunction != null) {
                    backButtonFunction();
                  } else {
                    Get.back();
                  }
                },
                child: Text(
                  cancelButton ?? 'Cancel',
                  style: const TextStyle(color: blackColor),
                ),
              ),
              // Logout button
              TextButton(
                onPressed: () {
                  function();
                  Get.back();
                },
                child: Text(
                  buttonName,
                  style: const TextStyle(color: redColor),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    barrierDismissible: false,
  );
}
