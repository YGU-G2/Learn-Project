import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/chats/chat_list_tile.dart';

class ChatsPage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const ChatsPage({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatListTile(
          appLocalizations: appLocalizations,
          imagePath: "assets/images/1.jpg",
          isConnect: true,
          messageCount: 12,
          subTitle: "hi",
          title: "maged alamri",
          delay: 500,
          chatHeroTag: "1",
        ),
        ChatListTile(
          appLocalizations: appLocalizations,
          imagePath: "assets/images/Logo.png",
          isConnect: false,
          messageCount: 4,
          subTitle: "Money",
          title: "University",
          lastDate: "3:44pm",
          delay: 550,
          chatHeroTag: "a",
        ),
        ChatListTile(
          appLocalizations: appLocalizations,
          imagePath: "assets/images/1.jpg",
          isConnect: true,
          messageCount: 12,
          subTitle: "hi",
          title: "maged alamri",
          delay: 600,
          chatHeroTag: "b",
        ),
        ChatListTile(
          appLocalizations: appLocalizations,
          imagePath: "assets/images/1.jpg",
          isConnect: true,
          messageCount: 12,
          subTitle: "hi",
          title: "maged alamri",
          delay: 650,
          chatHeroTag: "chatImage",
        ),
      ],
    );
  }
}
