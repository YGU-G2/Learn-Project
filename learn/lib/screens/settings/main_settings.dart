import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:just_bottom_sheet/drag_zone_position.dart';
import 'package:just_bottom_sheet/just_bottom_sheet.dart';
import 'package:just_bottom_sheet/just_bottom_sheet_configuration.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/screens/settings/account_settings.dart';
import 'package:learn/screens/settings/themes_main_settings.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/settings_tile.dart';

class MainSettings extends StatelessWidget {
  const MainSettings({super.key});

  static String id = "/main_settings";

  void setLanguage(String? languageCode) {
    LanguageController.setLanguage(languageCode ?? "ar");
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final scrollController = ScrollController();
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
              title: appLocalizations.settings,
            ),
          ),
          BounceInRight(
            delay: Duration(
              milliseconds: 700,
            ),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: SettintgsTile(
              onPressed: () => Get.toNamed(
                "${MainSettings.id}/${AccountSettings.id}",
              ),
              icon: Icons.manage_accounts_rounded,
              title: appLocalizations.account,
              supTitle: appLocalizations.accountDescription,
            ),
          ),
          BounceInRight(
            delay: Duration(
              milliseconds: 700,
            ),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: SettintgsTile(
              onPressed: () =>
                  Get.toNamed("${MainSettings.id}/${ThemesMainSettings.id}"),
              icon: Icons.color_lens_rounded,
              title: appLocalizations!.themes,
              supTitle: appLocalizations.themesDescription,
            ),
          ),
          BounceInRight(
            delay: Duration(
              milliseconds: 900,
            ),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: SettintgsTile(
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
                                title: appLocalizations.choseYourLanguage,
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
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          child: RadioListTile(
                                            value: "system",
                                            groupValue: LanguageController
                                                .currentLanguage,
                                            onChanged: (value) {
                                              setLanguage(value);
                                            },
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            selected: LanguageController
                                                    .currentLanguage ==
                                                "system",
                                            title: Text(
                                              appLocalizations.systemLanguage,
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
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          child: RadioListTile(
                                            value: "system",
                                            groupValue: LanguageController
                                                .currentLanguage,
                                            onChanged: (value) {
                                              setLanguage(value);
                                            },
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            selected: LanguageController
                                                    .currentLanguage ==
                                                "system",
                                            title: Text(
                                              appLocalizations.systemLanguage,
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
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          child: RadioListTile(
                                            value: "ar",
                                            groupValue: LanguageController
                                                .currentLanguage,
                                            onChanged: (value) {
                                              setLanguage(value);
                                            },
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            selected: LanguageController
                                                    .currentLanguage ==
                                                "ar",
                                            title: Text(
                                              appLocalizations.arabicLanguage,
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
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          child: RadioListTile(
                                            value: "ar",
                                            groupValue: LanguageController
                                                .currentLanguage,
                                            onChanged: (value) {
                                              setLanguage(value);
                                            },
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            selected: LanguageController
                                                    .currentLanguage ==
                                                "ar",
                                            title: Text(
                                              appLocalizations.arabicLanguage,
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
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          child: RadioListTile(
                                            value: "en",
                                            groupValue: LanguageController
                                                .currentLanguage,
                                            onChanged: (value) {
                                              setLanguage(value);
                                            },
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            selected: LanguageController
                                                    .currentLanguage ==
                                                "en",
                                            title: Text(
                                              appLocalizations.englishLanguage,
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
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          child: RadioListTile(
                                            value: "en",
                                            groupValue: LanguageController
                                                .currentLanguage,
                                            onChanged: (value) {
                                              setLanguage(value);
                                            },
                                            activeColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            selected: LanguageController
                                                    .currentLanguage ==
                                                "en",
                                            title: Text(
                                              appLocalizations.englishLanguage,
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
              icon: IonIcons.language,
              title: appLocalizations.language,
              supTitle: appLocalizations.languageDescription,
              trailing: Text(
                LanguageController.getCurrentLanguage() == "ar"
                    ? appLocalizations.arabicLanguage
                    : appLocalizations.englishLanguage,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Get.width * 0.035,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
