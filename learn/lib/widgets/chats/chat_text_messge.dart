import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Align(
        alignment: isSender ? Alignment.topRight : Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(
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
                        ? BorderSide(
                            color: Theme.of(context).colorScheme.onBackground,
                          )
                        : BorderSide.none,
                  ),
                  color: isSender
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).colorScheme.primary,
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
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            messageText,
                            style: TextStyle(
                              fontSize: Get.width * 0.035, // 14
                              color: isSender
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context).colorScheme.onSurface,
                              height: 1.5,
                            ),
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
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context)
                                        .colorScheme
                                        .onBackground,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            if (isSender)
                              Icon(
                                messageStatus == "waiting"
                                    ? Icons.schedule_rounded
                                    : messageStatus == "doneAll" ||
                                            messageStatus == "doneAllBlue"
                                        ? Icons.done_all_rounded
                                        : Icons.done_rounded,
                                size: Get.width * 0.045, // 18
                                color: isSender
                                    ? messageStatus == "doneAllBlue"
                                        ? Theme.of(context).colorScheme.primary
                                        : isSender
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onBackground
                                            : Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                    : messageStatus == "doneAllBlue"
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onBackground,
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
    );
  }
}
