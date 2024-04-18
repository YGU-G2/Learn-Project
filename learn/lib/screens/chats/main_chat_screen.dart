import 'package:flutter/material.dart';
import 'package:learn/pages/chats/chats_page.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainChatScreen extends StatelessWidget {
  const MainChatScreen({super.key});

  static String id = "/main_chat_screen";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      appLocalizations: appLocalizations!,
      name: MainChatScreen.id,
      usePageView: true,
      PageViewList: [
        ChatsPage(appLocalizations: appLocalizations,),
        Center(
          child: Text("مجموعات"),
        ),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.chat,
          Icons.person_rounded,
        ],
        [
          appLocalizations.groups,
          Icons.groups_rounded,
        ],
      ],
    );
  }
}
