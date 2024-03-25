import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageController {
  static const String selectedLanguageKey = "selectedLanguage";
  static String currentLanguage = "ar";
  static bool lang = true;

  static Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(selectedLanguageKey, languageCode);
    Get.updateLocale(languageCode == "system"
        ? Get.deviceLocale!.languageCode == "en"
            ? Locale("en")
            : Locale("ar")
        : Locale(languageCode));
    currentLanguage = languageCode;
  }

  static String getCurrentLanguage() {
    return currentLanguage == "system" ? Get.deviceLocale!.languageCode == "ar" ? "ar" : "en" : currentLanguage;
  }

  static Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedLanguageKey) ?? "ar";
  }

  static Future<Locale> getCurrentLocale() async {
    String languageCode =
        AppLocalizations.supportedLocales.contains(Locale(await getLanguage()))
            ? await getLanguage()
            : "ar";
    return Locale(languageCode);
  }
}
