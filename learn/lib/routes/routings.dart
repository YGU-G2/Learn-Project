import 'package:get/get.dart';
import 'package:learn/screens/dashboard/academic_affairs/academic_affairs.dart';
import 'package:learn/screens/dashboard/main_dashboard_screen.dart';
import 'package:learn/screens/dashboard/university/university_settings.dart';
import 'package:learn/screens/exams/main_exams_screen.dart';
import 'package:learn/screens/chats/main_chat_screen.dart';
import 'package:learn/screens/chats/single_chat_screen.dart';
import 'package:learn/screens/home/actitvites_main_page_datiles.dart';
import 'package:learn/screens/home/collage_main_page_datiles.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/screens/home/news_main_page_datiles.dart';
import 'package:learn/screens/lectuers/main_lectuers.dart';
import 'package:learn/screens/login.dart';
import 'package:learn/screens/settings/main_settings.dart';
import 'package:learn/screens/settings/themes_main_settings.dart';
import 'package:learn/screens/subjects/main_subjects_screen.dart';
import 'package:learn/screens/subjects/subjects_info.dart';
import 'package:learn/screens/subjects/subjects_media_links_docs.dart';

class Routings {
  static List<GetPage> routes = [
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
      ];
}
