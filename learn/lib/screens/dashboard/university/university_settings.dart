import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/pages/dashboard/activities_settings.dart';
import 'package:learn/pages/dashboard/collages_setting.dart';
import 'package:learn/pages/dashboard/main_university_settings.dart';
import 'package:learn/pages/dashboard/news_settings.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UniversitySettings extends StatelessWidget {
  static String id = "/university_settings";

  const UniversitySettings({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      name: UniversitySettings.id,
      appLocalizations: appLocalizations!,
      hasBack: true,
      bodyBackground: Theme.of(context).colorScheme.background,
      useAppBar: true,
      usePageView: true,
      PageViewList: [
        MainUniversitySettings(appLocalizations: appLocalizations),
        CollagesSetting(appLocalizations: appLocalizations),
        NemsSettings(appLocalizations: appLocalizations),
        ActvitiesSettings(
          appLocalizations: appLocalizations,
        ),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.university,
          Icons.account_balance_rounded,
        ],
        [
          appLocalizations.colleges,
          FontAwesome.building_wheat_solid,
        ],
        [
          appLocalizations.news,
          FontAwesome.newspaper,
        ],
        [
          appLocalizations.activites,
          Icons.widgets_rounded,
        ],
      ],
    );
  }
}
