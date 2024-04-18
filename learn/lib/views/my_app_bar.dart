import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/controller/language_controller.dart';

class MyAppBar extends StatelessWidget {
  final Animation<double> animation;
  final bool hasBack;
  final AppLocalizations appLocalizations;
  final Widget? content;

  const MyAppBar({
    super.key,
    required this.animation,
    this.hasBack = false,
    required this.appLocalizations,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LanguageController.currentLanguage == "system"
          ? Get.deviceLocale!.languageCode == "en"
              ? TextDirection.rtl
              : TextDirection.ltr
          : LanguageController.currentLanguage == "en"
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: Transform.translate(
        offset: Offset(0, -120 * animation.value),
        child: AppBar(
          leading: hasBack
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: Get.width * 0.1,
                    child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Get.theme.colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                )
              : null,
          elevation: 3,
          backgroundColor: Theme.of(context).primaryColorDark,
          title: content ??
              Padding(
                padding: EdgeInsets.only(
                  top: 15,
                  right: LanguageController.currentLanguage == "system"
                      ? Get.deviceLocale!.languageCode == "ar"
                          ? Get.width * 0.07
                          : 0
                      : LanguageController.currentLanguage == "ar"
                          ? Get.width * 0.07
                          : 0,
                  left: LanguageController.currentLanguage == "system"
                      ? Get.deviceLocale!.languageCode == "ar"
                          ? 0
                          : Get.width * 0.07
                      : LanguageController.currentLanguage == "ar"
                          ? 0
                          : Get.width * 0.07,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInRight(
                      delay: Duration(milliseconds: 1100),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          appLocalizations.universityFullName,
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: Get.width * 0.035, // 14
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    ZoomIn(
                      delay: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Image.asset(
                        "assets/images/Logo.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
