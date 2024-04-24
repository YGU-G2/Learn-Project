import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/screens/dashboard/academic_affairs/academic_affairs.dart';
import 'package:learn/screens/dashboard/students_affairs/students_affairs.dart';
import 'package:learn/screens/dashboard/university/university_settings.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/card_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainDashboardScreen extends StatelessWidget {
  static String id = "/main_dashboard";

  const MainDashboardScreen({super.key});

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
              title: appLocalizations.dashboard,
            ),
          ),
          Wrap(
            children: [
              ZoomIn(
                delay: Duration(milliseconds: 700),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: appLocalizations.university,
                  icon: Icons.account_balance_rounded,
                  onPressed: () {
                    Get.toNamed(
                      "${MainDashboardScreen.id}/${UniversitySettings.id}",
                    );
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: appLocalizations.academicAffairs,
                  icon: Icons.people_alt_rounded,
                  onPressed: () {
                    Get.toNamed(
                      "${MainDashboardScreen.id}/${AcademicAffairs.id}",
                    );
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1100),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: appLocalizations.studentsAffairs,
                  icon: Icons.groups_3_rounded,
                  onPressed: () {
                    Get.toNamed(
                      "${MainDashboardScreen.id}/${StudentsAffairs.id}",
                    );
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1300),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: CardButton(
                  text: "الدروس",
                  icon: Icons.menu_book_rounded,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
