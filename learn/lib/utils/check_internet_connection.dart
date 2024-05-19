import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:learn/controller/audios_player_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/utils/my_alert.dart';

class CheckInternetConnection extends GetxController {
  static RxBool isInternetOnLine = false.obs;

  static Future<void> checkTheInternet() async {
    try {
      final response = await http.get(Uri.parse('http://www.google.com'));
      if (response.statusCode == 200) {
        isInternetOnLine.value = true;
      } else {
        isInternetOnLine.value = false;
      }
    } catch (error) {
      isInternetOnLine.value = false;
    }
  }

  static void internetAlert() {
    MyAlert.snackbar(
      title: LanguageController.getCurrentLanguage() == "ar"
          ? "لا يوجد اتصال بالإنترنت"
          : "No Internet Connection",
      message: LanguageController.getCurrentLanguage() == "ar"
          ? "الاتصال بالانترنت مقطوع، تأكد من اتصالك بالانترنت."
          : "Internet connection is disconnected, make sure you are connected to the internet.",
      backgroundColor: Color.fromARGB(70, 239, 83, 80),
      colorText: Get.theme.primaryColorLight,
    );
  }

  static void internetAlertDialog() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(
        Directionality(
          textDirection: LanguageController.getCurrentLanguage() == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Get.theme.colorScheme.onBackground,
              ),
            ),
            backgroundColor: Get.theme.primaryColorDark,
            title: Row(
              children: [
                Icon(
                  Icons.wifi_off_rounded,
                  color: Get.theme.colorScheme.onPrimary,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  LanguageController.getCurrentLanguage() == "ar"
                      ? "لا يوجد اتصال بالإنترنت"
                      : "No Internet Connection",
                ),
              ],
            ),
            content: Text(
              LanguageController.getCurrentLanguage() == "ar"
                  ? "الاتصال بالانترنت مقطوع، تأكد من اتصالك بالانترنت."
                  : "Internet connection is disconnected, make sure you are connected to the internet.",
              style: TextStyle(
                color: Get.theme.colorScheme.onPrimary,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  LanguageController.getCurrentLanguage() == "ar"
                      ? "موافق"
                      : "Ok",
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
