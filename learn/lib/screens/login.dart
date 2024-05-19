import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/loading.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:learn/widgets/form/my_password_form_field.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final loginFormKey = GlobalKey<FormBuilderState>();

class Login extends StatelessWidget {
  static String id = "/login";

  const Login({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    void onLoginFieldsChanges(String name) {
      loginFormKey.currentState!.fields[name]!.validate(
        focusOnInvalid: false,
      );
    }

    void handleLogin() {
      if (loginFormKey.currentState!.saveAndValidate()) {
        LoginController.login(
          loginFormKey.currentState!.value['loginAcademicNumber'],
          loginFormKey.currentState!.value['loginPassword'],
        );
      }
    }

    return MyScaffold(
      appLocalizations: appLocalizations!,
      useAppBar: false,
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
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FormBuilder(
                      key: loginFormKey,
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
                            name: "loginAcademicNumber",
                            delay: 1100,
                            fillColor: Theme.of(context).colorScheme.background,
                            prefix: Icon(
                              Icons.person,
                            ),
                            onChanged: (value) {
                              onLoginFieldsChanges(
                                "loginAcademicNumber",
                              );
                            },
                            title: appLocalizations.academicNumber,
                            isRequired: true,
                            maxLength: 15,
                            keyboardType: TextInputType.number,
                            label: Text(
                              appLocalizations.enter(
                                appLocalizations.the(
                                  appLocalizations.academicNumber,
                                ),
                              ),
                            ),
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations.requiredField,
                              ),
                            ],
                          ),
                          MyPasswordFormField(
                            name: "loginPassword",
                            delay: 1300,
                            prefix: const Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            onChanged: (value) {
                              onLoginFieldsChanges(
                                "loginPassword",
                              );
                            },
                            title: appLocalizations.password,
                            isRequired: true,
                            label: Text(
                              appLocalizations.enter(
                                appLocalizations.the(
                                  appLocalizations.password,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations.requiredField,
                              ),
                              FormBuilderValidators.minLength(
                                8,
                                errorText: appLocalizations.minLength(
                                  8,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment:
                                LanguageController.getCurrentLanguage() == "ar"
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: FadeInRight(
                                delay: Duration(milliseconds: 1500),
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(milliseconds: 500),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    appLocalizations.forgotThePassword,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                  ),
                                ),
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
                              child: Obx(
                                () => MyButton(
                                  onPressed: () {
                                    handleLogin();
                                  },
                                  child: LoginController.isLoginLoading.value
                                      ? Loading.getCubeGrid()
                                      : Text(
                                          appLocalizations.login,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
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
