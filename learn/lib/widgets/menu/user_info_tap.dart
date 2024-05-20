import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/controller/theme_controller.dart';
import 'package:learn/screens/settings/account_settings.dart';
import 'package:learn/screens/settings/main_settings.dart';
import 'package:learn/screens/settings/profile_settings.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:learn/widgets/circle_icon_button.dart';
import 'package:learn/widgets/color_swap.dart';
import 'package:learn/widgets/loading.dart';

class UserInfoTap extends StatefulWidget {
  const UserInfoTap({
    super.key,
    required this.name,
    required this.profission,
    required this.mainController,
    required this.currentColor,
    required this.imagePath,
  });

  final String name, profission, imagePath;
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
    List<Widget> buttons = [
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
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          splashColor: Theme.of(context).splashColor,
          onTap: !LoginController.isLogined.value
              ? null
              : () => Get.toNamed(
                    "${MainSettings.id}${AccountSettings.id}${ProfileSettings.id}",
                  ),
          title: Column(
            crossAxisAlignment: LoginController.isLogined.value
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: LoginController.isLogined.value
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    if (LoginController.isLogined.value)
                      OfflineBuilder(
                        connectivityBuilder: (
                          BuildContext context,
                          ConnectivityResult connectivity,
                          Widget child,
                        ) {
                          CheckInternetConnection.checkTheInternet();
                          if (CheckInternetConnection.isInternetOnLine.value &&
                              widget.imagePath.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  widget.imagePath,
                                ),
                                onBackgroundImageError:
                                    (exception, stackTrace) => Icon(
                                  CupertinoIcons.person,
                                  color: Theme.of(context).primaryColorDark,
                                  size: 50,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            );
                          } else {
                            return CircleAvatar(
                              radius: 50,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: Icon(
                                CupertinoIcons.person,
                                color: Theme.of(context).primaryColorDark,
                                size: 50,
                              ),
                            );
                          }
                        },
                        child: Loading.getCubeGrid(
                          size: Get.width * 0.062, //25
                        ),
                      ),
                    Column(
                      crossAxisAlignment: LoginController.isLogined.value
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
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
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          press: () {
                            toggleThemeMode();
                          },
                        ),
                        if (!LoginController.isLogined.value)
                          Row(
                            children: [
                              buttons[0],
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: buttons[1],
                              )
                            ],
                          ),
                        if (LoginController.isLogined.value) buttons[0],
                        if (LoginController.isLogined.value) buttons[1],
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          ),
          subtitle: Text(
            widget.profission,
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
