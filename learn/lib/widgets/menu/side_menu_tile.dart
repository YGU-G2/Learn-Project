import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/widgets/menu/menu_items.dart';

class SideMenuTile extends StatelessWidget {
  final MenuItems mune;
  final VoidCallback press;

  const SideMenuTile({
    super.key,
    required this.mune,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  color: (mune.key.contains(Get.currentRoute))
                      ? Get.theme.colorScheme.background
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.all(5),
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: press,
                  child: ListTile(
                    splashColor: Get.theme.splashColor,
                    leading: SizedBox(
                      width: 34,
                      height: 34,
                      child: Icon(
                        mune.icon,
                        size: 24,
                        color: Get.theme.primaryColorLight,
                      ),
                    ),
                    title: Text(
                      mune.title,
                      style: TextStyle(
                        color: Get.theme.primaryColorLight,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    trailing: mune.trailing,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              width: (mune.key.contains(Get.currentRoute)) ? 5 : 0,
              height: 25,
              top: 18.5,
              right: LanguageController.getCurrentLanguage() == "ar" ? 6 : null,
              left: LanguageController.getCurrentLanguage() == "ar" ? null : 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
