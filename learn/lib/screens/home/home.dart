import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/pages/main/about_main_page.dart';
import 'package:learn/pages/main/activites_main_page.dart';
import 'package:learn/pages/main/collages_main_page.dart';
import 'package:learn/pages/main/main_page.dart';
import 'package:learn/pages/main/news_main_page.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static String id = "/home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MainController mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      name: Home.id,
      hasBack: false,
      appLocalizations: appLocalizations!,
      bodyBackground: Theme.of(context).colorScheme.background,
      useAppBar: true,
      usePageView: true,
      PageViewList: [
        MainPage(
          appLocalizations: appLocalizations,
        ),
        CollagesMainPage(
          appLocalizations: appLocalizations,
        ),
        NewsMainPage(
          appLocalizations: appLocalizations,
        ),
        ActivitesMainPage(
          appLocalizations: appLocalizations,
        ),
        AboutPage(
          appLocalizations: appLocalizations,
        ),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.home,
          Icons.home,
        ],
        [
          appLocalizations.colleges,
          FontAwesome.building_wheat_solid,
        ],
        [
          appLocalizations.news,
          Icons.newspaper,
        ],
        [
          appLocalizations.activites,
          Icons.widgets_rounded,
        ],
        [
          appLocalizations.about,
          Icons.info,
        ],
      ],
    );
  }
}
