import 'package:flutter/material.dart';
import 'package:learn/pages/lectuers/lectuers_home_page.dart';
import 'package:learn/pages/lectuers/lectuers_not_presented_page.dart';
import 'package:learn/pages/lectuers/lectuers_presented_page.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainLectuers extends StatelessWidget {
  const MainLectuers({super.key});

  static String id = "/main_lectuers";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      name: MainLectuers.id,
      appLocalizations: appLocalizations!,
      useAppBar: true,
      hasBack: true,
      usePageView: true,
      PageViewList: [
        LectuersHomePage(
          appLocalizations: appLocalizations,
        ),
        LectuersPresentedPage(
          appLocalizations: appLocalizations,
        ),
        LectuersNotPresentedPage(
          appLocalizations: appLocalizations,
        ),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.lectuers,
          Icons.video_collection_rounded,
        ],
        [
          appLocalizations.supLectuersPresented,
          Icons.library_add_check_rounded,
        ],
        [
          appLocalizations.supLectuersNotPresented,
          Icons.cancel_presentation_rounded,
        ]
      ],
    );
  }
}