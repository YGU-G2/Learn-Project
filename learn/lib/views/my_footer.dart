import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/widgets/contact_list_tile.dart';
import 'package:learn/widgets/social_media_button.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyFooter extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const MyFooter({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    Widget title = SizedBox(
      width: Get.width * 0.487, // 200
      child: Text(
        appLocalizations.universityFullName,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: Get.width * 0.035, // 14
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return Stack(
      children: [
        SizedBox(
          height: Get.height / 1.25,
          child: WaveWidget(
            config: CustomConfig(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              durations: [5000, 3000, 4000],
              heightPercentages: [
                0.03,
                0.01,
                0.02,
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height,
            ),
            waveAmplitude: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 130),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ZoomIn(
                    delay: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: Image.asset(
                      "assets/images/Logo.png",
                      width: Get.width * 0.195, // 80
                      height: Get.width * 0.195, // 80
                      fit: BoxFit.cover,
                    ),
                  ),
                  LanguageController.getCurrentLanguage() == "ar"
                      ? FadeInRight(
                          delay: Duration(milliseconds: 700),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: title,
                        )
                      : FadeInLeft(
                          delay: Duration(milliseconds: 1100),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: title,
                        ),
                ],
              ),
              FadeInDown(
                delay: Duration(milliseconds: 1300),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                  child: Align(
                    alignment: LanguageController.getCurrentLanguage() == "ar"
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Text(
                      appLocalizations.stayInTouch,
                      style: TextStyle(
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 1500),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.phone,
                        text:
                            "صنعاء - مذبح جوار نادي الشعب 01/371402 - 01/371074",
                      ),
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 1500),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.phone,
                        text:
                            "صنعاء - مذبح جوار نادي الشعب 01/371402 - 01/371074",
                      ),
                    ),
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 1700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.phone,
                        text:
                            "الحديدة - شارع فلسطين (زايد سابقاً) امام دار الايتام الشعب 03/205397",
                      ),
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 1700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.phone,
                        text:
                            "الحديدة - شارع فلسطين (زايد سابقاً) امام دار الايتام الشعب 03/205397",
                      ),
                    ),
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 1900),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.phone,
                        text: "جوال 779414140/730414140 - الحديدة - 773973895",
                      ),
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 1900),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.phone,
                        text: "جوال 779414140/730414140 - الحديدة - 773973895",
                      ),
                    ),
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 2100),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.email_rounded,
                        text: "Ygulfuniv@gmail.com - info@yg-u.net",
                      ),
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 2100),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.email_rounded,
                        text: "Ygulfuniv@gmail.com - info@yg-u.net",
                      ),
                    ),
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 2300),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.public_rounded,
                        text: "www.yg-u.net",
                      ),
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 2300),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.public_rounded,
                        text: "www.yg-u.net",
                      ),
                    ),
              LanguageController.getCurrentLanguage() == "ar"
                  ? FadeInRight(
                      delay: Duration(milliseconds: 2500),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.location_on,
                        text: "الجمهورية اليمنية",
                      ),
                    )
                  : FadeInLeft(
                      delay: Duration(milliseconds: 2500),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ContactListTile(
                        icon: Icons.location_on,
                        text: "الجمهورية اليمنية",
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ZoomIn(
                    delay: Duration(milliseconds: 2700),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: SocialMediaButton(icon: Brand(Brands.facebook_2)),
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: 2900),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: SocialMediaButton(icon: Brand(Brands.whatsapp)),
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: 3100),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: SocialMediaButton(icon: Brand(Brands.youtube)),
                  ),
                  ZoomIn(
                    delay: Duration(milliseconds: 3300),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: SocialMediaButton(icon: Brand(Brands.twitterx_2)),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              FadeInUp(
                delay: Duration(milliseconds: 3500),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesome.copyright,
                      color: Get.theme.colorScheme.onSurface,
                      size: Get.width * 0.05,
                    ),
                    Text(
                      "   ${DateTime.now().year} ${appLocalizations.allRightsReserved} ",
                      style: TextStyle(
                        color: Get.theme.colorScheme.onSurface,
                        fontSize: Get.width * 0.035,
                      ),
                    ),
                    Text(
                      appLocalizations.myName,
                      style: TextStyle(
                        color: Get.theme.colorScheme.onSurface,
                        fontSize: Get.width * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
