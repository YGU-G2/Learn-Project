import 'package:flutter/material.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainExamsScreen extends StatelessWidget {

  static String id = "/main_exams_screen";

  const MainExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      appLocalizations: appLocalizations!,
    );
  }
}