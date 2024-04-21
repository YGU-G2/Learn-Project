import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login/login_controller.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/controller/theme_controller.dart';
import 'package:learn/routes/routings.dart';
import 'package:learn/screens/home/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int selectedColor = await ThemeController.getSelectedColor();
  int modeIndex = await ThemeController.getThemeModeIndex();
  ThemeController.colorNum = selectedColor;
  ThemeController.themeModeIndex = modeIndex;

  String selectedLanguage = await LanguageController.getLanguage();
  LanguageController.currentLanguage = selectedLanguage;
  LanguageController.lang = selectedLanguage == "ar" ? true : false;
  Locale currentLanguage = await LanguageController.getCurrentLocale();

  if (selectedLanguage == 'system') {
    selectedLanguage = Get.deviceLocale!.languageCode;
  }

  LoginController.isLogined = await LoginController.getLogin();

  Get.updateLocale(Locale(selectedLanguage));
  Get.changeTheme(
    Themes.getTheme(
      selectedColor,
      modeIndex == 0
          ? Get.isPlatformDarkMode
              ? true
              : false
          : modeIndex == 1
              ? false
              : true,
    ),
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    currentLanguage: currentLanguage,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    this.currentLanguage,
  });

  final Locale? currentLanguage;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return GetMaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: currentLanguage,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Learn',
      initialRoute: Home.id,
      themeMode: ThemeMode.light,
      getPages: Routings.routes,
      initialBinding: BindingsBuilder(
        () {
          Get.put(TableController());
          Get.put(MainController());
        },
      ),
    );
  }
}
