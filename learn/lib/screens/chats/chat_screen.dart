import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/chats/chat_date.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = "/_chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
            leading: Hero(
              tag: "chatImage",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/1.jpg',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
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
      body: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              ChatDate(
                date: "2/4/2024",
              ),
              ChatMessage(
                isSender: true,
                messageText: "magwj iuio gfhr yuu kiyioy drt",
                messageTime: "11:20pm",
                showImage: true,
                showSenderName: false,
                imagePath: 'assets/images/1.jpg',
                messageStatus: 'doneAllBlue',
                isFollowingMessage: false,
              ),
              ChatMessage(
                isSender: true,
                messageText: "magwj kjgjg .l;lk udtdcgl ;klkk; l;l;ljlj",
                messageTime: "11:20pm",
                showImage: false,
                showSenderName: false,
                messageStatus: 'doneAll',
                isFollowingMessage: true,
              ),
              ChatMessage(
                isSender: false,
                messageText:
                    "magwj kjgjg .l;lk udtdc dggdg fhdh fdfdfhfh fgffj jfgfhjf cfhf gl ;klkk; l;l;ljlj",
                messageTime: "11:20pm",
                showImage: true,
                imagePath: 'assets/images/1.jpg',
                showSenderName: true,
                senderName: "maged alamri",
                messageStatus: 'doneAllBlue',
                isFollowingMessage: false,
              ),
              ChatMessage(
                isSender: false,
                messageText: "mag",
                messageTime: "11:20pm",
                showImage: false,
                showSenderName: true,
                senderName: "maged alamri",
                messageStatus: 'doneAll',
                isFollowingMessage: true,
              ),
              ChatMessage(
                isSender: true,
                messageText:
                    "magwj kjgjg .l;lk udtdcgl ;klkk; l;l;ljlj ggjh tdtd iuio gfhr yuu kiyioy drt",
                messageTime: "11:20pm",
                showImage: true,
                showSenderName: false,
                imagePath: 'assets/images/1.jpg',
                messageStatus: 'done',
                isFollowingMessage: false,
              ),
              ChatMessage(
                isSender: true,
                messageText: "magwj kjgjg .l;lk udtdcgl ;klkk; l;l;ljlj",
                messageTime: "11:20pm",
                showImage: false,
                showSenderName: false,
                messageStatus: 'waiting',
                isFollowingMessage: true,
              ),
              ChatMessage(
                isSender: false,
                messageText:
                    "magwj kjghfh fgffj jfgfhjf cfhf gl ;klkk; l;l;ljlj",
                messageTime: "11:20pm",
                showImage: true,
                imagePath: 'assets/images/1.jpg',
                showSenderName: true,
                senderName: "maged alamri",
                messageStatus: 'done',
                isFollowingMessage: false,
              ),
              ChatMessage(
                isSender: false,
                messageText: "mahhjh hgh jkkj jhkh jkhlh g",
                messageTime: "11:20pm",
                showImage: false,
                showSenderName: true,
                senderName: "maged alamri",
                messageStatus: 'waiting',
                isFollowingMessage: true,
              ),
              ChatMessage(
                isSender: false,
                messageText: "mahhjh hgh jkkj jhkh jkhlh g",
                messageTime: "11:20pm",
                showImage: false,
                showSenderName: true,
                senderName: "maged alamri",
                messageStatus: 'waiting',
                isFollowingMessage: true,
              ),
              ChatMessage(
                isSender: false,
                messageText: "mahhjh hgh jkkj jhkh jkhlh g",
                messageTime: "11:20pm",
                showImage: false,
                showSenderName: true,
                senderName: "maged alamri",
                messageStatus: 'waiting',
                isFollowingMessage: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String? senderName;
  final String messageText;
  final String messageTime;
  final String? messageStatus;
  final String? imagePath;
  final bool showImage;
  final bool isSender;
  final bool showSenderName;
  final bool isFollowingMessage;

  const ChatMessage({
    super.key,
    this.senderName,
    required this.messageText,
    required this.messageTime,
    this.messageStatus,
    this.imagePath,
    required this.showImage,
    required this.isSender,
    required this.showSenderName,
    required this.isFollowingMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
      child: Transform.translate(
        offset: Offset(0, isFollowingMessage ? -30 : 0),
        child: Align(
          alignment: isSender ? Alignment.topRight : Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isFollowingMessage ? 0 : Get.width * 0.025,
              horizontal: Get.width * 0.025, // 10
            ),
            child: Stack(
              alignment: isSender ? Alignment.topRight : Alignment.topLeft,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: isSender ? 23 : 0,
                    left: isSender ? 0 : 23,
                    top: 20,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: isSender
                          ? BorderSide.none
                          : BorderSide(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                    ),
                    color: isSender
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).primaryColorDark,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: Get.width * 0.025, // 10
                        left: isSender
                            ? Get.width * 0.025
                            : isFollowingMessage
                                ? Get.width * 0.025
                                : 40,
                        bottom: Get.width * 0.025, // 10
                        right: isSender
                            ? isFollowingMessage
                                ? Get.width * 0.025
                                : 40
                            : Get.width * 0.025,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (senderName != null)
                            Text(
                              senderName ?? "",
                              style: TextStyle(
                                fontSize: Get.width * 0.025, // 10
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          Text(
                            messageText,
                            style: TextStyle(
                              fontSize: Get.width * 0.035, // 14
                              color: isSender
                                  ? Theme.of(context).colorScheme.onSurface
                                  : Theme.of(context).primaryColorLight,
                              height: 1.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                messageTime,
                                style: TextStyle(
                                  fontSize: Get.width * 0.027, // 11
                                  color: isSender
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onBackground
                                      : Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                messageStatus == "waiting"
                                    ? Icons.schedule_rounded
                                    : messageStatus == "doneAll" ||
                                            messageStatus == "doneAllBlue"
                                        ? Icons.done_all_rounded
                                        : Icons.done_rounded,
                                color: isSender
                                    ? messageStatus == "doneAllBlue"
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onBackground
                                    : messageStatus == "doneAllBlue"
                                        ? Theme.of(context).colorScheme.primary
                                        : isSender
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (showImage)
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    radius: 30,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 0,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            imagePath ?? 'assets/images/1.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
