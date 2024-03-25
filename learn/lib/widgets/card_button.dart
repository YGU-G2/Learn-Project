import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const CardButton({
    super.key, required this.icon, required this.text, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2,
      height: Get.width / 3,
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: TextButton(
            onPressed: onPressed,
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    icon,
                    size: Get.width * 0.12,
                    color: Get.theme.colorScheme.primary,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: Get.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColorLight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
