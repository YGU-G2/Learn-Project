import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyTitle extends StatelessWidget {
  const BodyTitle({
    super.key,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.fontSize,
    this.lineThickness,
  });

  final String title;
  final CrossAxisAlignment crossAxisAlignment;
  final double? fontSize;
  final double? lineThickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.width * 0.05),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? Get.width * 0.06,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
                fontFamily: "Arial",
                decoration: TextDecoration.none,
                shadows: null,
              ),
            ),
          ),
          SizedBox(
            width: Get.width / 1.5,
            child: Divider(
              thickness: lineThickness ?? 2,
              color: Get.theme.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
