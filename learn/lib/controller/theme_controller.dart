import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController {
  static const String selectedColorKey = "selectedColor";
  static const String themeModeIndexKey = "themeModeIndex";
  static int themeModeIndex = 0;
  static int colorNum = 2;

  static Future<void> setTheme(int colorNumber, int modeIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(selectedColorKey, colorNumber);
    await prefs.setInt(themeModeIndexKey, modeIndex);
    Get.changeTheme(
      Themes.getTheme(
        colorNumber,
        modeIndex == 0
            ? Get.isPlatformDarkMode
                ? true
                : false
            : modeIndex == 1
                ? false
                : true,
      ),
    );    
    themeModeIndex = modeIndex;
    colorNum = colorNumber;
  }

  static ThemeMode getCurrentThemeMode() {
    ThemeMode themeMode;
    if (themeModeIndex == 0) {
      if (Get.isPlatformDarkMode) {
        themeMode = ThemeMode.dark;
      } else {
        themeMode = ThemeMode.light;
      }
    } else if (themeModeIndex == 1) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    return themeMode;
  }

  static Future<int> getSelectedColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(selectedColorKey) ?? 2;
  }

  static Future<int> getThemeModeIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(themeModeIndexKey) ?? 2;
  }
}
