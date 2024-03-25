import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAlert {
  static snackbar({required String title, required String message,
      Color? colorText, Color? backgroundColor}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: colorText ?? Get.theme.primaryColorLight,
      margin: const EdgeInsets.all(10),
      borderRadius: 5,
    );
  } 
}
