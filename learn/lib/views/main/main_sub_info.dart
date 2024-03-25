import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainSubInfo extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const MainSubInfo({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    Widget title = SizedBox(
      width: Get.width - Get.width * 0.07,
      child: Text(
        appLocalizations.universityFullName,
        style: TextStyle(
          fontSize: Get.width * 0.05,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: BodyTitle(title: appLocalizations.aboutUniversity),
        ),
        ZoomIn(
          delay: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: Transform.translate(
            offset: const Offset(0, -40),
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Logo.png",
                  ),
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -70),
          child: Column(
            children: [
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: title,
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: title,
                    ),
              BounceInDown(
                delay: Duration(milliseconds: 1000),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              FlipInY(
                delay: Duration(milliseconds: 1200),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: MyButton(
                    onPressed: () {},
                    child: Text(
                      appLocalizations.register,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
