import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/controller/theme_controller.dart';
import 'package:learn/screens/settings/main_settings.dart';
import 'package:learn/widgets/circle_icon_button.dart';
import 'package:learn/widgets/color_swap.dart';

class UserInfoTap extends StatefulWidget {
  const UserInfoTap({
    super.key,
    required this.Name,
    required this.Profission,
    required this.mainController,
    required this.currentColor,
  });

  final String Name, Profission;
  final MainController mainController;
  final ColorItems currentColor;

  @override
  State<UserInfoTap> createState() => _UserInfoTapState();
}

class _UserInfoTapState extends State<UserInfoTap> {
  void toggleThemeMode() {
    setState(() {
      ThemeController.setTheme(
        ThemeController.colorNum,
        (ThemeController.themeModeIndex == 0)
            ? Get.isPlatformDarkMode
                ? 1
                : 2
            : (ThemeController.themeModeIndex == 1)
                ? 2
                : 1,
      );
      // widget.mainController.isDarkMode.value =
      //     !widget.mainController.isDarkMode.value;
      // widget.mainController.myChangeTheme(
      //   context: context,
      //   theme: widget.mainController.isDarkMode.value
      //       ? Themes.getTheme(
      //           widget.currentColor.themeNumber,
      //           true,
      //         )
      //       : Themes.getTheme(
      //           widget.currentColor.themeNumber,
      //           false,
      //         ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          splashColor: Theme.of(context).splashColor,
          onTap: () {},
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(
                        CupertinoIcons.person,
                        color: Theme.of(context).primaryColorDark,
                        size: 50,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleIconButton(
                        icon: Icon(
                          (ThemeController.themeModeIndex == 0)
                              ? Get.isPlatformDarkMode
                                  ? CupertinoIcons.moon_stars_fill
                                  : CupertinoIcons.sun_max_fill
                              : (ThemeController.themeModeIndex == 2)
                                  ? CupertinoIcons.moon_stars_fill
                                  : CupertinoIcons.sun_max_fill,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        backgroundColor: Theme.of(context).colorScheme.background,
                        press: () {
                          toggleThemeMode();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleIconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Theme.of(context).primaryColorLight,
                          ),
                          backgroundColor: Theme.of(context).colorScheme.background,
                          press: () {},
                        ),
                      ),
                      CircleIconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Theme.of(context).primaryColorLight,
                        ),
                        backgroundColor: Theme.of(context).colorScheme.background,
                        press: () {
                          Get.toNamed(MainSettings.id);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                widget.Name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          ),
          subtitle: Text(
            widget.Profission,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            height: 1,
          ),
        )
      ],
    );
  }
}
