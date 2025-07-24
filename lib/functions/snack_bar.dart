import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

void showSuccessSnackbar({required String message}) {
  Get.rawSnackbar(
    messageText: Text(
      message,
      style: const TextStyle(fontSize: 13, color: whiteColor),
    ),
    backgroundColor: greenColor,
    borderRadius: 5,
    maxWidth: 500,
    icon: const Icon(Icons.check_circle_outline_rounded, color: whiteColor),
    mainButton: TextButton(
      onPressed: () => Get.back(),
      child: const Text(
        'OK',
        style: TextStyle(color: whiteColor, fontWeight: FontWeight.w600),
      ),
    ),
    margin: const EdgeInsets.all(20),
  );
}

void showErrorSnackbar({required String message}) {
  Get.rawSnackbar(
    messageText: Text(
      message,
      style: const TextStyle(fontSize: 13, color: whiteColor),
    ),
    icon: const Icon(Icons.error_outline_rounded, color: whiteColor),
    backgroundColor: redColor,
    borderRadius: 5,
    maxWidth: 500,
    mainButton: TextButton(
      onPressed: () => Get.back(),
      child: const Text(
        'OK',
        style: TextStyle(color: whiteColor, fontWeight: FontWeight.w600),
      ),
    ),
    // duration: const Duration(seconds: 4),
    margin: const EdgeInsets.all(20),
  );
}
