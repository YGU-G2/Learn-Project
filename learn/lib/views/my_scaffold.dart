import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/main_controller.dart';
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
import 'package:learn/screens/subjects/main_subjects_screen.dart';
import 'package:learn/screens/subjects/subjects_info.dart';
import 'package:learn/screens/subjects/subjects_media_links_docs.dart';
import 'package:learn/views/bottom_navigation_bar_items.dart';
import 'package:learn/widgets/menu/menu_btn.dart';
import 'package:learn/views/my_app_bar.dart';
import 'package:learn/widgets/menu/menu_items.dart';
import 'package:learn/widgets/menu/side_menu.dart';
import 'package:learn/widgets/menu/side_menu_tile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyScaffold extends StatefulWidget {
  final String? name;
  final bool useAppBar;
  final bool usePageView;
  final List<Widget>? PageViewList;
  final Widget? body;
  final List<List>? bottomNavigationBarItems;
  final Color? bodyBackground;
  final bool hasBack;
  final AppLocalizations appLocalizations;

  const MyScaffold({
    super.key,
    this.useAppBar = true,
    this.body,
    this.usePageView = false,
    this.PageViewList,
    this.bottomNavigationBarItems,
    this.bodyBackground,
    this.hasBack = true,
    required this.appLocalizations,
    this.name,
  });

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold>
    with SingleTickerProviderStateMixin {
  final MainController mainController = Get.find<MainController>();
  late PageController pageController;
  late bool isSideBarClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    pageController =
        PageController(initialPage: mainController.getPage(widget.name ?? ""));
    if (widget.name != null) {
      mainController.addToMap(widget.name!);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void changeSideBarStatus() {
    if (isSideBarClosed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(() {
      isSideBarClosed = !isSideBarClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItems> sideMenu = [
      MenuItems(
        title: widget.appLocalizations.home,
        icon: Icons.home,
        key: [
          Home.id,
          "${Home.id}/${CollageMainPageDatiles.id}",
          "${Home.id}/${NewsMainPageDatiles.id}",
          "${Home.id}/${ActivitesMainPageDatiles.id}",
        ],
      ),
      MenuItems(
        title: widget.appLocalizations.dashboard,
        icon: Icons.dashboard_rounded,
        key: [
          MainDashboardScreen.id,
          "${MainDashboardScreen.id}/${UniversitySettings.id}",
          "${MainDashboardScreen.id}/${AcademicAffairs.id}",
        ],
      ),
      MenuItems(
        title: widget.appLocalizations.chat,
        icon: CupertinoIcons.chat_bubble_2_fill,
        key: ["b"],
      ),
      MenuItems(
        title: widget.appLocalizations.lectuers,
        icon: Icons.video_library_rounded,
        key: [
          MainLectuers.id,
        ],
      ),
      MenuItems(
        title: widget.appLocalizations.subjects,
        icon: Icons.collections_bookmark_rounded,
        key: [
          MainSubjectsScreen.id,
          "${MainSubjectsScreen.id}/${SubjectsInfo.id}",
          "${MainSubjectsScreen.id}/${SubjectsInfo.id}/${SubjectsMediaLinksDocs.id}",
        ],
      ),
      MenuItems(
        title: widget.appLocalizations.exams,
        icon: Icons.assignment_rounded,
        key: [
          MainExamsScreen.id,
        ],
      ),
      MenuItems(
        title: widget.appLocalizations.login,
        icon: Icons.login_rounded,
        key: [Login.id],
      ),
    ];
    return Directionality(
      textDirection: LanguageController.currentLanguage == "system"
          ? Get.deviceLocale!.languageCode == "en"
              ? TextDirection.ltr
              : TextDirection.rtl
          : LanguageController.currentLanguage == "en"
              ? TextDirection.ltr
              : TextDirection.rtl,
      child: Stack(
        children: [
          Scaffold(
            appBar: widget.useAppBar
                ? PreferredSize(
                    preferredSize: Size(MediaQuery.of(context).size.width, 70),
                    child: MyAppBar(
                      animation: animation,
                      hasBack: widget.hasBack,
                      appLocalizations: widget.appLocalizations,
                    ),
                  )
                : null,
            backgroundColor: Theme.of(context).primaryColorDark,
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  width: 288,
                  right: LanguageController.getCurrentLanguage() == "ar"
                      ? isSideBarClosed
                          ? -288
                          : 0
                      : null,
                  left: LanguageController.getCurrentLanguage() == "ar"
                      ? null
                      : isSideBarClosed
                          ? -288
                          : 0,
                  height: MediaQuery.of(context).size.height,
                  child: SideMenu(
                    MenuItemsList: [
                      ...sideMenu.map(
                        (menu) => SideMenuTile(
                          mune: menu,
                          press: () {
                            setState(
                              () {
                                bool f = true;
                                changeSideBarStatus();
                                if (menu.key.first != "b" &&
                                    menu.key.first != "c") {
                                  for (var element in menu.key) {
                                    if (Get.currentRoute == element) {
                                      f = false;
                                    }
                                  }
                                  if (f) {
                                    Get.toNamed(menu.key.first);
                                  }
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                      LanguageController.getCurrentLanguage() == "ar"
                          ? -(animation.value - 30 * animation.value * pi / 180)
                          : (animation.value - 30 * animation.value * pi / 180),
                    ),
                  child: Transform.translate(
                    offset: Offset(
                      LanguageController.getCurrentLanguage() == "ar"
                          ? -(animation.value * 265)
                          : (animation.value * 265),
                      0,
                    ),
                    child: Transform.scale(
                      scale: scaleAnimation.value,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(isSideBarClosed ? 0 : 24),
                        child: Container(
                          color: widget.bodyBackground ??
                              Theme.of(context).colorScheme.background,
                          child: widget.usePageView
                              ? PageView(
                                  controller: pageController,
                                  onPageChanged: (page) =>
                                      mainController.animateToPage(
                                          page, pageController, widget.name!),
                                  children: widget.PageViewList!,
                                )
                              : widget.body,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: widget.usePageView
                ? Transform.translate(
                    offset: Offset(0, 100 * animation.value),
                    child: BottomAppBar(
                      color: Theme.of(context).primaryColorDark,
                      elevation: 0,
                      notchMargin: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.shadow,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 35,
                          vertical: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: RxList.generate(widget.PageViewList!.length,
                              (index) {
                            return BottomNavigationBarItems(
                              name: widget.name!,
                              pageController: pageController,
                              mainController: mainController,
                              page: index,
                              text: widget.bottomNavigationBarItems![index][0],
                              icon: widget.bottomNavigationBarItems![index][1],
                            );
                          }),
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            right: LanguageController.currentLanguage == "system"
                ? Get.deviceLocale!.languageCode == "ar"
                    ? isSideBarClosed
                        ? 0
                        : 230
                    : null
                : LanguageController.currentLanguage == "ar"
                    ? isSideBarClosed
                        ? 0
                        : 230
                    : null,
            left: LanguageController.currentLanguage == "system"
                ? Get.deviceLocale!.languageCode == "ar"
                    ? null
                    : isSideBarClosed
                        ? 0
                        : 230
                : LanguageController.currentLanguage == "ar"
                    ? null
                    : isSideBarClosed
                        ? 0
                        : 230,
            child: MenuBtn(
              press: () => changeSideBarStatus(),
              isSideBarClosed: isSideBarClosed,
            ),
          ),
        ],
      ),
    );
  }
}
