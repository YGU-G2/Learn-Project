import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/screens/home/news_main_page_datiles.dart';
import 'package:learn/views/my_footer.dart';
import 'package:learn/widgets/list_tile_card.dart';
import '../../widgets/body_title.dart';

class NewsMainPage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const NewsMainPage({
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
            title: appLocalizations.all(appLocalizations.news),
          ),
        ),
        ListTileCard(
          title: "اخبار المهندسين",
          press: () => Get.toNamed("${Home.id}/${NewsMainPageDatiles.id}"),
        ),
        ListTileCard(
          title: "اخبار الدكاترة",
          press: () => Get.toNamed("${Home.id}/${NewsMainPageDatiles.id}"),
        ),
        ListTileCard(
          title: "اخبار المحاسبين",
          press: () => Get.toNamed("${Home.id}/${NewsMainPageDatiles.id}"),
        ),
        MyFooter(
          appLocalizations: appLocalizations,
        ),
      ],
    );
  }
}
