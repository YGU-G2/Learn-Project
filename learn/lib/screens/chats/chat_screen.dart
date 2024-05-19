import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/chats/chat_date.dart';
import 'package:learn/widgets/chats/chat_text_messge.dart';
import 'package:animated_emoji/animated_emoji.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = "/_chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatFormKey = GlobalKey<FormBuilderState>();
  bool canSend = false;

  void _onChatFieldsChanges() {
    setState(() {
      final String value =
          chatFormKey.currentState!.fields["messageText"]!.value;
      if (value.isNotEmpty) {
        canSend = true;
      } else {
        canSend = false;
      }
    });
  }

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
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
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
                        "magwj kjgjg .l;lk udtdc dggdg fhdh fdfdfhfh fgffj j jgkjg jkgjkgk ugkj gkj gjgj jgjgjg lg k gjkg jgjg j fgfhjf cfhf gl ;klkk; l;l;ljlj",
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
                  SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(Get.width * 0.025),
                  child: FormBuilder(
                    key: chatFormKey,
                    child: FormBuilderTextField(
                      name: "messageText",
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).primaryColorDark,
                        prefixIcon: SizedBox(
                          width: 45,
                          height: 45,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.emoji_emotions_rounded,
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (!canSend)
                              Transform.rotate(
                                angle: 10,
                                child: SizedBox(
                                  width: 45,
                                  height: 45,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.attach_file_rounded,
                                    ),
                                  ),
                                ),
                              ),
                            if (!canSend)
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: TextButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                  ),
                                ),
                              ),
                            if (canSend)
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.send_rounded,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      onChanged: (value) => _onChatFieldsChanges(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
