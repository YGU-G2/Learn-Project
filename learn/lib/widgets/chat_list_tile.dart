import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:learn/screens/chats/main_chat_screen.dart';
import 'package:learn/screens/chats/single_chat_screen.dart';

class ChatListTile extends StatelessWidget {
  final AppLocalizations appLocalizations;
  final String title;
  final String subTitle;
  final String imagePath;
  final bool isConnect;
  final String? lastDate;
  final int messageCount;
  final int delay;

  const ChatListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
    required this.isConnect,
    this.lastDate,
    required this.messageCount,
    required this.appLocalizations,
    this.delay = 200,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(
        milliseconds: delay,
      ),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
        ),
        onPressed: () {
          Get.toNamed("${MainChatScreen.id}/${SingleChatScreen.id}");
        },
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: Get.width * 0.040, // 16
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                isConnect ? appLocalizations.onLine : lastDate!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Get.width * 0.03, // 12
                ),
              ),
            ],
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: Get.width * 0.035,
            ),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          trailing: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 12,
            child: Text(
              "$messageCount",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: Get.width * 0.03, // 12
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
