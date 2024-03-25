import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:learn/widgets/form/my_password_form_field.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  static String id = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    Widget forgotThePassword = TextButton(
      onPressed: () {},
      child: Text(
        appLocalizations!.forgotThePassword,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
    return MyScaffold(
      appLocalizations: appLocalizations!,
      bodyBackground: Theme.of(context).colorScheme.background,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Transform.rotate(
                    angle: -pi / 1,
                    child: SizedBox(
                      height: 300,
                      child: WaveWidget(
                        config: CustomConfig(
                          colors: [
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          durations: [5000, 3000, 4000],
                          heightPercentages: [
                            0.15,
                            0.13,
                            0.14,
                          ],
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        size: Size(
                          MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height,
                        ),
                        waveAmplitude: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        ZoomIn(
                          delay: Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: Image.asset(
                            "assets/images/Logo.png",
                            width: 200,
                            height: 200,
                          ),
                        ),
                        FadeInDown(
                          delay: Duration(milliseconds: 700),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: Transform.translate(
                            offset: const Offset(0, -30),
                            child: Text(
                              appLocalizations.universityFullName,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: Align(
                      alignment: LanguageController.getCurrentLanguage() == "ar"
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(
                          left:
                              (LanguageController.getCurrentLanguage() == "ar")
                                  ? 16
                                  : 0,
                          right:
                              (LanguageController.getCurrentLanguage() == "ar")
                                  ? 0
                                  : 16,
                          top: 16,
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).primaryColorDark,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.shadow,
                              offset: Offset(0, 3),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Get.theme.colorScheme.primary,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              FormBuilder(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          FadeInDown(
                            delay: Duration(milliseconds: 900),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: BodyTitle(
                              title: appLocalizations.login,
                            ),
                          ),
                          MyTextFormField(
                            name: "",
                            delay: 1100,
                            fillColor: Theme.of(context).colorScheme.background,
                            prefix: Icon(
                              Icons.person,
                            ),
                            title: appLocalizations.academicNumber,
                            isRequired: true,
                            maxLength: 15,
                            keyboardType: TextInputType.number,
                            label: Text(appLocalizations.enter(appLocalizations
                                .the(appLocalizations.academicNumber))),
                          ),
                          MyPasswordFormField(
                            name: "",
                            delay: 1300,
                            prefix: Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            title: appLocalizations.password,
                            isRequired: true,
                            label: Text(appLocalizations.enter(appLocalizations
                                .the(appLocalizations.password))),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          Align(
                            alignment:
                                LanguageController.getCurrentLanguage() == "ar"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: LanguageController.getCurrentLanguage() ==
                                      "ar"
                                  ? FadeInRight(
                                      delay: Duration(milliseconds: 1500),
                                      curve: Curves.fastOutSlowIn,
                                      duration: Duration(milliseconds: 500),
                                      child: forgotThePassword,
                                    )
                                  : FadeInLeft(
                                      delay: Duration(milliseconds: 1500),
                                      curve: Curves.fastOutSlowIn,
                                      duration: Duration(milliseconds: 500),
                                      child: forgotThePassword,
                                    ),
                            ),
                          ),
                          FlipInY(
                            delay: Duration(milliseconds: 1700),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Get.width * 0.025),
                              child: MyButton(
                                onPressed: () {},
                                child: Text(
                                  appLocalizations.login,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
