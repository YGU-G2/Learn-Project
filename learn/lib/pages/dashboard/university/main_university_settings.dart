import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:learn/widgets/my_button.dart';

class MainUniversitySettings extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const MainUniversitySettings({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 90,
        bottom: 80,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FadeInDown(
              delay: Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: BodyTitle(
                title: appLocalizations.university,
              ),
            ),
            FlipInY(
              delay: Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: Text(
                appLocalizations.universityLogo,
                style: TextStyle(
                  fontSize: Get.width * 0.04, // 16
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ZoomIn(
              delay: Duration(milliseconds: 900),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    child: Image.asset("assets/images/Logo.png"),
                    radius: Get.width * 0.28,
                  ),
                  Transform.translate(
                    offset: Offset(-30, -10),
                    child: MyButton(
                      elevation: 0,
                      onPressed: () {},
                      child: Icon(
                        Icons.camera_alt,
                        color: Get.theme.colorScheme.onSurface,
                        size: Get.width * 0.05,
                      ),
                      width: Get.width * 0.10,
                      height: Get.width * 0.10,
                      borderRadius: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextFormField(
              name: "",
              delay: 1100,
              fillColor: Theme.of(context).primaryColorDark,
              title:
                  appLocalizations.universityName(appLocalizations.arabic),
              isRequired: true,
              keyboardType: TextInputType.name,
              label: Text(
                appLocalizations.enter(
                  appLocalizations.universityName(
                    appLocalizations.arabic,
                  ),
                ),
              ),
              prefix: Icon(Icons.account_balance_rounded),
              width: Get.width / 1.05,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextFormField(
              name: "",
              delay: 1300,
              fillColor: Theme.of(context).primaryColorDark,
              title:
                  appLocalizations.universityName(appLocalizations.english),
              isRequired: true,
              keyboardType: TextInputType.name,
              label: Text(
                appLocalizations.enter(
                  appLocalizations.universityName(
                    appLocalizations.english,
                  ),
                ),
              ),
              prefix: Icon(Icons.account_balance_rounded),
              width: Get.width / 1.05,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextFormField(
              name: "",
              delay: 1500,
              fillColor: Theme.of(context).primaryColorDark,
              title: appLocalizations.aboutUniversity,
              isRequired: true,
              label: Text(appLocalizations.aboutUniversity),
              prefix: Icon(Icons.account_balance_rounded),
              width: Get.width / 1.05,
              maxLines: 6,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextFormField(
              name: "",
              delay: 1700,
              fillColor: Theme.of(context).primaryColorDark,
              title: appLocalizations.presidentSpeech,
              isRequired: true,
              label: Text(appLocalizations.presidentSpeech),
              prefix: Icon(Icons.account_balance_rounded),
              width: Get.width / 1.05,
              maxLines: 6,
            ),
            SizedBox(
              height: 20,
            ),
            FlipInY(
              delay: Duration(milliseconds: 1900),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: MyButton(
                onPressed: () {},
                child: Text(
                  appLocalizations.save,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: Get.width * 0.040, // 16
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
