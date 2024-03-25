import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/screens/home/actitvites_main_page_datiles.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/views/my_footer.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/list_tile_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivitesMainPage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const ActivitesMainPage({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: BodyTitle(
            title: appLocalizations.all(appLocalizations.activites),
          ),
        ),
        ListTileCard(
          title: "نشاط 1",
          press: () => Get.toNamed("${Home.id}/${ActivitesMainPageDatiles.id}"),
        ),
        ListTileCard(
          title: "نشاط 2",
          press: () => Get.toNamed("${Home.id}/${ActivitesMainPageDatiles.id}"),
        ),
        ListTileCard(
          title: "نشاط 3",
          press: () => Get.toNamed("${Home.id}/${ActivitesMainPageDatiles.id}"),
        ),
        MyFooter(
          appLocalizations: appLocalizations,
        ),
      ],
    );
  }
}
