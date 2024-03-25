import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';

class MenuBtn extends StatelessWidget {
  final VoidCallback press;
  final bool isSideBarClosed;

  const MenuBtn({
    super.key,
    required this.press,
    required this.isSideBarClosed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          right: LanguageController.currentLanguage == "system"
              ? Get.deviceLocale!.languageCode == "ar"
                  ? 16
                  : 0
              : LanguageController.currentLanguage == "ar"
                  ? 16
                  : 0,
          left: LanguageController.currentLanguage == "system"
              ? Get.deviceLocale!.languageCode == "ar"
                  ? 0
                  : 16
              : LanguageController.currentLanguage == "ar"
                  ? 0
                  : 16,
          top: 16,
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColorDark,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              offset: Offset(0, 3),
              blurRadius: 8.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: press,
            child: isSideBarClosed
                ? Icon(
                    Icons.menu,
                    color: Get.theme.colorScheme.primary,
                    size: 28,
                  )
                : Icon(
                    Icons.close,
                    color: Get.theme.colorScheme.primary,
                    size: 28,
                  ),
          ),
        ),
      ),
    );
  }
}
