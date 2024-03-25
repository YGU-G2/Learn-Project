import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/screens/subjects/subjects_info.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/card_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainSubjectsScreen extends StatelessWidget {
  static String id = "/main_subjects";
  const MainSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return MyScaffold(
      appLocalizations: appLocalizations!,
      hasBack: true,
      bodyBackground: Theme.of(context).colorScheme.background,
      useAppBar: true,
      body: ListView(
        children: [
          FadeInDown(
            delay: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: appLocalizations.subjects,
            ),
          ),
          Wrap(
            children: [
              ZoomIn(
                delay: Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "C++",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {
                    Get.toNamed("${MainSubjectsScreen.id}/${SubjectsInfo.id}");
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "JavaScript",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {
                    Get.toNamed("${MainSubjectsScreen.id}/${SubjectsInfo.id}");
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1100),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "C#",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {
                    Get.toNamed("${MainSubjectsScreen.id}/${SubjectsInfo.id}");
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1300),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "Flutter",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {
                    Get.toNamed("${MainSubjectsScreen.id}/${SubjectsInfo.id}");
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1500),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "Java",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {
                    Get.toNamed("${MainSubjectsScreen.id}/${SubjectsInfo.id}");
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1700),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "Python",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {
                    Get.toNamed("${MainSubjectsScreen.id}/${SubjectsInfo.id}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
