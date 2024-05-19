import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/screens/settings/main_settings.dart';
import 'package:learn/screens/settings/profile_settings.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/settings_tile.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  static String id = "/account_settings";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return MyScaffold(
      appLocalizations: appLocalizations!,
      body: Padding(
        padding: EdgeInsets.only(top: 90),
        child: Column(
          children: [
            FadeInDown(
              delay: Duration(
                milliseconds: 500,
              ),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: BodyTitle(
                title: appLocalizations.account,
              ),
            ),
            BounceInRight(
              delay: Duration(
                milliseconds: 700,
              ),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: SettintgsTile(
                onPressed: () => Get.toNamed(
                  "${MainSettings.id}${AccountSettings.id}${ProfileSettings.id}",
                ),
                icon: Icons.manage_accounts_outlined,
                title: appLocalizations.profile,
                supTitle: appLocalizations.profileDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
