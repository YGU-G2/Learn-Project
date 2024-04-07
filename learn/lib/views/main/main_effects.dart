import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainEffects extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const MainEffects({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BodyTitle(title: appLocalizations.factsInterestYou),
        SizedBox(
          width: Get.width - (Get.width * 0.122), // All Width - 50
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.037), // 15
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "8",
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            appLocalizations.yearsOfGiving,
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "155",
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            appLocalizations.facultyMembers,
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "18",
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            appLocalizations.programs,
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "4",
                            style: TextStyle(
                              fontSize: Get.width * 0.045,
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            appLocalizations.colleges,
                            style: TextStyle(
                              fontSize: Get.width * 0.035,
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
