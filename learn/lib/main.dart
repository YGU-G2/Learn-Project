import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/controller/theme_controller.dart';
import 'package:learn/screens/chats/main_chat_screen.dart';
import 'package:learn/screens/chats/single_chat_screen.dart';
import 'package:learn/screens/dashboard/academic_affairs/academic_affairs.dart';
import 'package:learn/screens/dashboard/main_dashboard_screen.dart';
import 'package:learn/screens/dashboard/university/university_settings.dart';
import 'package:learn/screens/exams/main_exams_screen.dart';
import 'package:learn/screens/home/actitvites_main_page_datiles.dart';
import 'package:learn/screens/home/collage_main_page_datiles.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/screens/home/news_main_page_datiles.dart';
import 'package:learn/screens/lectuers/main_lectuers.dart';
import 'package:learn/screens/login.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/screens/settings/main_settings.dart';
import 'package:learn/screens/settings/themes_main_settings.dart';
import 'package:learn/screens/subjects/main_subjects_screen.dart';
import 'package:learn/screens/subjects/subjects_info.dart';
import 'package:learn/screens/subjects/subjects_media_links_docs.dart';
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
      localizationsDelegates: [
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
      getPages: [
        GetPage(
          name: Home.id,
          page: () => Home(),
          title: "الرئيسية",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
          children: [
            GetPage(
              name: CollageMainPageDatiles.id,
              page: () => CollageMainPageDatiles(),
              title: "معلومات الكلية",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            ),
            GetPage(
              name: NewsMainPageDatiles.id,
              page: () => NewsMainPageDatiles(),
              title: "الاخبار",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            ),
            GetPage(
              name: ActivitesMainPageDatiles.id,
              page: () => ActivitesMainPageDatiles(),
              title: "الانشطة",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            )
          ],
        ),
        GetPage(
          name: MainChatScreen.id,
          page: () => MainChatScreen(),
          title: "الدردشات",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
          children: [
            GetPage(
              name: SingleChatScreen.id,
              page: () => SingleChatScreen(),
              title: "الدردشةالفردية",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            ),
          ],
        ),
        GetPage(
          name: MainDashboardScreen.id,
          page: () => MainDashboardScreen(),
          title: "لوحة التحكم",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
          children: [
            GetPage(
              name: UniversitySettings.id,
              page: () => UniversitySettings(),
              title: "الجامعة",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            ),
            GetPage(
              name: AcademicAffairs.id,
              page: () => AcademicAffairs(),
              title: "الشؤون الأكاديمية",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            ),
          ],
        ),
        GetPage(
          name: MainLectuers.id,
          page: () => MainLectuers(),
          title: "المحاضرات",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
        ),
        GetPage(
          name: MainSubjectsScreen.id,
          page: () => MainSubjectsScreen(),
          title: "المواد الدراسية",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
          children: [
            GetPage(
              name: SubjectsInfo.id,
              page: () => SubjectsInfo(),
              title: "معلومات المادة",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
              children: [
                GetPage(
                  name: SubjectsMediaLinksDocs.id,
                  page: () => SubjectsMediaLinksDocs(),
                  title: "وسائط وروابط ومستندات",
                  transition: Transition.cupertinoDialog,
                  transitionDuration: Duration(milliseconds: 1000),
                ),
              ],
            ),
          ],
        ),
        GetPage(
          name: MainExamsScreen.id,
          page: () => MainExamsScreen(),
          title: "الأختبارات",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
        ),
        GetPage(
          name: Login.id,
          page: () => Login(),
          title: "تسجيل الدخول",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
        ),
        GetPage(
          name: MainSettings.id,
          page: () => MainSettings(),
          title: "الأعدادات",
          transition: Transition.cupertinoDialog,
          transitionDuration: Duration(milliseconds: 1000),
          children: [
            GetPage(
              name: ThemesMainSettings.id,
              page: () => ThemesMainSettings(),
              title: "الأعدادات - السمات",
              transition: Transition.cupertinoDialog,
              transitionDuration: Duration(milliseconds: 1000),
            ),
          ],
        ),
      ],
      initialBinding: BindingsBuilder(() {
        Get.put(TableController());
        Get.put(MainController());
      }),
    );
  }
}
