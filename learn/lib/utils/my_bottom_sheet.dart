import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomSheet {
  static void getBottomSheet({
    required Widget content,
  }) {
    Get.bottomSheet(
      isScrollControlled: true,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: Get.width,
            height: 35,
            decoration: BoxDecoration(
              color: Get.theme.primaryColorDark,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          content
        ],
      ),
    );
  }
}
