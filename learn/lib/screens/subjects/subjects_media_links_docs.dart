import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubjectsMediaLinksDocs extends StatelessWidget {
  const SubjectsMediaLinksDocs({super.key});

  static String id = "/subjects_media_links_docs";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      name: SubjectsMediaLinksDocs.id,
      appLocalizations: appLocalizations!,
      useAppBar: true,
      hasBack: true,
      usePageView: true,
      PageViewList: [
        Text('media'),
        Text('documents'),
        Text('links'),
      ],
      bottomNavigationBarItems: [
        [
          appLocalizations.media,
          Icons.perm_media_rounded,
        ],
        [
          appLocalizations.documents,
          IonIcons.documents,
        ],
        [
          appLocalizations.links,
          Icons.link,
        ]
      ],
    );
  }
}