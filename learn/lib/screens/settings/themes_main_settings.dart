import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_bottom_sheet/drag_zone_position.dart';
import 'package:just_bottom_sheet/just_bottom_sheet_configuration.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/theme_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/color_swap.dart';
import 'package:learn/widgets/settings_tile.dart';
import 'package:just_bottom_sheet/just_bottom_sheet.dart';

class ThemesMainSettings extends StatelessWidget {
  const ThemesMainSettings({super.key});

  static String id = "/themes_main_settings";

  void setTheme(int? value) {
    ThemeController.setTheme(ThemeController.colorNum, value ?? 0);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final scrollController = ScrollController();
    Widget themeMode = SettintgsTile(
      onPressed: () {
        showJustBottomSheet(
          context: context,
          dragZoneConfiguration: JustBottomSheetDragZoneConfiguration(
            dragZonePosition: DragZonePosition.inside,
            backgroundColor: Get.theme.primaryColorDark,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 5,
                width: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          configuration: JustBottomSheetPageConfiguration(
            height: Get.height / 2,
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColorDark,
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    FadeInDown(
                      delay: Duration(
                        milliseconds: 0,
                      ),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: BodyTitle(
                        title: appLocalizations!.choseYourMode,
                        fontSize: Get.width * 0.045,
                        lineThickness: 1.5,
                      ),
                    ),
                    Column(
                      children: [
                        LanguageController.getCurrentLanguage() == "ar"
                            ? FadeInRight(
                                delay: Duration(
                                  milliseconds: 300,
                                ),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: Material(
                                  color: Theme.of(context).primaryColorDark,
                                  child: RadioListTile(
                                    value: 0,
                                    groupValue: ThemeController.themeModeIndex,
                                    onChanged: (value) {
                                      setTheme(value);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selected:
                                        ThemeController.themeModeIndex == 0,
                                    title: Text(
                                      appLocalizations.defaultSystem,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : FadeInLeft(
                                delay: Duration(
                                  milliseconds: 300,
                                ),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: Material(
                                  color: Theme.of(context).primaryColorDark,
                                  child: RadioListTile(
                                    value: 0,
                                    groupValue: ThemeController.themeModeIndex,
                                    onChanged: (value) {
                                      setTheme(value);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selected:
                                        ThemeController.themeModeIndex == 0,
                                    title: Text(
                                      appLocalizations.defaultSystem,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        LanguageController.getCurrentLanguage() == "ar"
                            ? FadeInRight(
                                delay: Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: Material(
                                  color: Theme.of(context).primaryColorDark,
                                  child: RadioListTile(
                                    value: 2,
                                    groupValue: ThemeController.themeModeIndex,
                                    onChanged: (value) {
                                      setTheme(value);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selected:
                                        ThemeController.themeModeIndex == 2,
                                    title: Text(
                                      appLocalizations.dark,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : FadeInLeft(
                                delay: Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: Material(
                                  color: Theme.of(context).primaryColorDark,
                                  child: RadioListTile(
                                    value: 2,
                                    groupValue: ThemeController.themeModeIndex,
                                    onChanged: (value) {
                                      setTheme(value);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selected:
                                        ThemeController.themeModeIndex == 2,
                                    title: Text(
                                      appLocalizations.dark,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        LanguageController.getCurrentLanguage() == "ar"
                            ? FadeInRight(
                                delay: Duration(
                                  milliseconds: 700,
                                ),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: Material(
                                  color: Theme.of(context).primaryColorDark,
                                  child: RadioListTile(
                                    value: 1,
                                    groupValue: ThemeController.themeModeIndex,
                                    onChanged: (value) {
                                      setTheme(value);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selected:
                                        ThemeController.themeModeIndex == 1,
                                    title: Text(
                                      appLocalizations.light,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : FadeInLeft(
                                delay: Duration(
                                  milliseconds: 700,
                                ),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: Material(
                                  color: Theme.of(context).primaryColorDark,
                                  child: RadioListTile(
                                    value: 1,
                                    groupValue: ThemeController.themeModeIndex,
                                    onChanged: (value) {
                                      setTheme(value);
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.primary,
                                    selected:
                                        ThemeController.themeModeIndex == 1,
                                    title: Text(
                                      appLocalizations.light,
                                      style: TextStyle(
                                        fontSize: Get.width * 0.040,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
              );
            },
            scrollController: scrollController,
            closeOnScroll: true,
            cornerRadius: 10,
          ),
        );
      },
      icon: Icons.settings_display_rounded,
      title: appLocalizations!.themesMode,
      supTitle:
          "${appLocalizations.dark}, ${appLocalizations.light}, ${appLocalizations.defaultSystem}",
      trailing: Text(
        "${ThemeController.themeModeIndex == 0 ? Get.isPlatformDarkMode ? appLocalizations.dark : appLocalizations.light : ThemeController.themeModeIndex == 1 ? appLocalizations.light : appLocalizations.dark}",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: Get.width * 0.035,
        ),
      ),
    );
    Widget themeColor = SettintgsTile(
      onPressed: () {
        showJustBottomSheet(
          context: context,
          dragZoneConfiguration: JustBottomSheetDragZoneConfiguration(
            dragZonePosition: DragZonePosition.inside,
            backgroundColor: Get.theme.primaryColorDark,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 5,
                width: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          configuration: JustBottomSheetPageConfiguration(
            height: Get.height / 2.8,
            builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).primaryColorDark,
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    FadeInDown(
                      delay: Duration(
                        milliseconds: 0,
                      ),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: BodyTitle(
                        title: appLocalizations.choseYourFavoriteColor,
                        fontSize: Get.width * 0.045,
                        lineThickness: 1.5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...colorItems.map(
                          (color) => ZoomIn(
                            delay: Duration(
                              milliseconds: 500 + (color.themeNumber * 100),
                            ),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: ColorSwap(
                              colors: color,
                              press: () {
                                ThemeController.setTheme(
                                  color.themeNumber,
                                  ThemeController.themeModeIndex,
                                );
                                Get.back();
                              },
                              isActive:
                                  ThemeController.colorNum == color.themeNumber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            scrollController: scrollController,
            closeOnScroll: true,
            cornerRadius: 10,
          ),
        );
      },
      icon: Icons.format_color_fill_rounded,
      title: appLocalizations.colors,
      supTitle: appLocalizations.allColors,
      trailing: Text(
        "${ThemeController.colorNum == 4 ? appLocalizations.purple : ThemeController.colorNum == 1 ? appLocalizations.red : ThemeController.colorNum == 2 ? appLocalizations.blue : ThemeController.colorNum == 3 ? appLocalizations.yellow : appLocalizations.green}",
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: Get.width * 0.035,
        ),
      ),
    );
    return MyScaffold(
      appLocalizations: appLocalizations!,
      useAppBar: true,
      hasBack: true,
      body: ListView(
        children: [
          FadeInDown(
            delay: Duration(
              milliseconds: 500,
            ),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: appLocalizations.themes,
            ),
          ),
          LanguageController.getCurrentLanguage() == "ar"
              ? FadeInRight(
                  delay: Duration(
                    milliseconds: 700,
                  ),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: themeMode,
                )
              : FadeInLeft(
                  delay: Duration(
                    milliseconds: 700,
                  ),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: themeMode,
                ),
          LanguageController.getCurrentLanguage() == "ar"
              ? FadeInRight(
                  delay: Duration(
                    milliseconds: 900,
                  ),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: themeColor,
                )
              : FadeInLeft(
                  delay: Duration(
                    milliseconds: 900,
                  ),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: themeColor,
                ),
        ],
      ),
    );
  }
}
