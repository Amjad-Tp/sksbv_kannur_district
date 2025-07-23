import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sksbv_kannur_jilla/functions/constants.dart';

void snackbar(String message) {
  Get.rawSnackbar(
    maxWidth: 500,
    messageText: Text(
      message,
      style: const TextStyle(fontSize: 13, color: whiteColor),
    ),
    backgroundColor: lightBlackColor,
    borderRadius: 5,
    mainButton: TextButton(
      onPressed: () => Get.back(),
      child: const Text(
        'OK',
        style: TextStyle(color: royalBlue, fontWeight: FontWeight.w600),
      ),
    ),
    duration: const Duration(seconds: 4),
    margin: const EdgeInsets.all(20),
  );
}
