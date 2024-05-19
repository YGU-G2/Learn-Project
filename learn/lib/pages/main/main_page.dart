import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/views/main/main_effects.dart';
import 'package:learn/views/main/main_sub_activites.dart';
import 'package:learn/views/main/main_sub_collage.dart';
import 'package:learn/views/main/main_sub_info.dart';
import 'package:learn/views/main/main_sub_news.dart';
import 'package:learn/views/my_footer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/internet_status.dart';

class MainPage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const MainPage({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Get.height * 0.11, // 95
            bottom: 80,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                MainSubInfo(
                  appLocalizations: appLocalizations,
                ),
                MainSubCollages(
                  appLocalizations: appLocalizations,
                ),
                MianSubNews(
                  appLocalizations: appLocalizations,
                ),
                MainEffects(
                  appLocalizations: appLocalizations,
                ),
                MainSubActivites(
                  appLocalizations: appLocalizations,
                ),
                MyFooter(
                  appLocalizations: appLocalizations,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 80,
          child: InternetStatus(
            appLocalizations: appLocalizations,
          ),
        )
      ],
    );
  }
}
