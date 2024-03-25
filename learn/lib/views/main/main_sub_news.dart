import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/my_card_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MianSubNews extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const MianSubNews({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyTitle(title: appLocalizations.latestUniversityNews),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              MyCardSlider(
                appLocalizations: appLocalizations,
              ),
              MyCardSlider(
                appLocalizations: appLocalizations,
              ),
              MyCardSlider(
                appLocalizations: appLocalizations,
              ),
              MyCardSlider(
                appLocalizations: appLocalizations,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
