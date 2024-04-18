import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/chat_list_tile.dart';

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
        ),
        ChatListTile(
          appLocalizations: appLocalizations,
          imagePath: "assets/images/1.jpg",
          isConnect: true,
          messageCount: 12,
          subTitle: "hi",
          title: "maged alamri",
          delay: 600,
        ),
        ChatListTile(
          appLocalizations: appLocalizations,
          imagePath: "assets/images/1.jpg",
          isConnect: true,
          messageCount: 12,
          subTitle: "hi",
          title: "maged alamri",
          delay: 650,
        ),
      ],
    );
  }
}
