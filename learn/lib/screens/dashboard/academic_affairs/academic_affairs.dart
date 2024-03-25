import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/pages/academic_affairs/education_staff_page.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:learn/widgets/body_title.dart';

class AcademicAffairs extends StatelessWidget {
  static String id = "/academic_affairs";

  const AcademicAffairs({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      name: AcademicAffairs.id,
      appLocalizations: appLocalizations!,
      useAppBar: true,
      hasBack: true,
      usePageView: true,
      PageViewList: [
        EducationStaffPage(
          appLocalizations: appLocalizations,
        ),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.educationStaff,
          Icons.school_rounded,
        ],
      ],
    );
  }
}
