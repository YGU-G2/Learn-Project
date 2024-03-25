import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
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
    Widget yearsOfGiving = Text(
      appLocalizations.yearsOfGiving,
      style: TextStyle(
        fontSize: Get.width * 0.035,
        color: Theme.of(context).primaryColorLight,
        fontWeight: FontWeight.bold,
      ),
    );
    Widget facultyMembers = Text(
      appLocalizations.facultyMembers,
      style: TextStyle(
        fontSize: Get.width * 0.035,
        color: Theme.of(context).primaryColorLight,
        fontWeight: FontWeight.bold,
      ),
    );
    Widget programs = Text(
      appLocalizations.programs,
      style: TextStyle(
        fontSize: Get.width * 0.035,
        color: Theme.of(context).primaryColorLight,
        fontWeight: FontWeight.bold,
      ),
    );
    Widget colleges = Text(
      appLocalizations.colleges,
      style: TextStyle(
        fontSize: Get.width * 0.035,
        color: Theme.of(context).primaryColorLight,
        fontWeight: FontWeight.bold,
      ),
    );
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
                          BounceInDown(
                            delay: Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              "8",
                              style: TextStyle(
                                fontSize: Get.width * 0.045,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          LanguageController.getCurrentLanguage() == "ar"
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 900),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: yearsOfGiving,
                                )
                              : FadeInLeft(
                                  delay: Duration(milliseconds: 900),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: yearsOfGiving,
                                ),
                        ],
                      ),
                      Column(
                        children: [
                          BounceInDown(
                            delay: Duration(milliseconds: 1100),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              "155",
                              style: TextStyle(
                                fontSize: Get.width * 0.045,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          LanguageController.getCurrentLanguage() == "ar"
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 1300),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: facultyMembers,
                                )
                              : FadeInLeft(
                                  delay: Duration(milliseconds: 1300),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: facultyMembers,
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
                          BounceInDown(
                            delay: Duration(milliseconds: 1500),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              "18",
                              style: TextStyle(
                                fontSize: Get.width * 0.045,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          LanguageController.getCurrentLanguage() == "ar"
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 1700),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: programs,
                                )
                              : FadeInLeft(
                                  delay: Duration(milliseconds: 1700),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: programs,
                                ),
                        ],
                      ),
                      Column(
                        children: [
                          BounceInDown(
                            delay: Duration(milliseconds: 1900),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              "4",
                              style: TextStyle(
                                fontSize: Get.width * 0.045,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          LanguageController.getCurrentLanguage() == "ar"
                              ? FadeInRight(
                                  delay: Duration(milliseconds: 2100),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: colleges,
                                )
                              : FadeInLeft(
                                  delay: Duration(milliseconds: 2100),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: colleges,
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
