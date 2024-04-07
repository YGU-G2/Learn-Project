import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/widgets/color_swap.dart';
import 'package:learn/widgets/menu/user_info_tap.dart';

class SideMenu extends StatefulWidget {
  final List MenuItemsList;

  const SideMenu({super.key, required this.MenuItemsList});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final MainController mainController = Get.find<MainController>();
  ColorItems selectedColor = colorItems.first;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LanguageController.getCurrentLanguage() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            right: LanguageController.getCurrentLanguage() == "ar" ? 5 : 0,
            left: LanguageController.getCurrentLanguage() == "ar" ? 0 : 5,
            top: 45,
          ),
          width: 288,
          height: double.infinity,
          color: Theme.of(context).primaryColorDark,
          child: Column(
            children: [
              Expanded(
                child: UserInfoTap(
                  currentColor: selectedColor,
                  mainController: mainController,
                  name: "إبراهيم الحربي",
                  profission: "الأسطورة",
                ),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      widget.MenuItemsList.length,
                      (index) => widget.MenuItemsList[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
