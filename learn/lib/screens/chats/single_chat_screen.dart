import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});
  static String id = "/single_chat_screen";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      appLocalizations: appLocalizations!,
      showMenuBtn: false,
      appBarContent: Directionality(
        textDirection: LanguageController.getCurrentLanguage() == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/1.jpg',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "maged alamri",
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: Get.width * 0.040, // 16
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              appLocalizations.onLine,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Get.width * 0.035,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
