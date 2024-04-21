import 'package:flutter/material.dart';
import 'package:learn/pages/dashboard/students_affairs/students_page.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StudentsAffairs extends StatelessWidget {
  const StudentsAffairs({super.key});

  static String id = "/students_affairs";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return MyScaffold(
      appLocalizations: appLocalizations!,
      name: StudentsAffairs.id,
      usePageView: true,
      PageViewList: [
        StudentsPage(
          appLocalizations: appLocalizations,
        ),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.students,
          Icons.groups_2_rounded,
        ]
      ],
    );
  }
}
