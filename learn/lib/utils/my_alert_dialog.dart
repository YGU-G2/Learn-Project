import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/audios_player_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyAlertDialog {
  static void showMyAlertDialog({
    required AppLocalizations appLocalizations,
    bool isDeleteAlert = true,
    String? whoDelete,
    String? title,
    String? content,
    IconData? icon,
    bool isOkBtn = false,
    VoidCallback? onYesBtnPressed,
    Color? iconColor,
  }) {
    AudioPlayerController.play('audios/1.mp3');
    Get.dialog(
      Directionality(
        textDirection: LanguageController.getCurrentLanguage() == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: AlertDialog(
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          backgroundColor: Get.theme.primaryColorDark,
          shadowColor: Get.theme.colorScheme.shadow,
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
            vertical: Get.height * 0.05,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Get.theme.colorScheme.onBackground,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.all(
              Get.width * 0.037,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor ?? Get.theme.colorScheme.onPrimary,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title ?? appLocalizations.verificationMessage,
                  style: TextStyle(
                    color: Get.theme.primaryColorLight,
                    fontSize: Get.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(
                right: Get.width * 0.05, // 20
                left: Get.width * 0.05, // 20
                bottom: Get.width * 0.05, // 20
              ),
              child: Text(
                isDeleteAlert
                    ? appLocalizations.deleteSure(whoDelete ?? '')
                    : content ?? '',
                style: TextStyle(
                  color: Get.theme.colorScheme.onPrimary,
                  fontSize: Get.width * 0.040,
                ),
              ),
            ),
          ),
          actions: [
            if (isOkBtn)
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  appLocalizations.ok,
                ),
              ),
            if (isOkBtn == false)
              Padding(
                padding: EdgeInsets.all(
                  Get.width * 0.025,
                ), // 10
                child: TextButton(
                  onPressed: onYesBtnPressed ??
                      () {
                        Get.back();
                      },
                  child: Text(
                    appLocalizations.yes,
                  ),
                ),
              ),
            if (isOkBtn == false)
              Padding(
                padding: EdgeInsets.all(
                  Get.width * 0.025,
                ), // 10
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    appLocalizations.no,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
