import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:learn/controller/academic_affairs/education_staff_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/utils/format_founctions.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:learn/widgets/form/my_date_form_field.dart';
import 'package:learn/widgets/form/my_password_form_field.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum UpdateFieldsType {
  text,
  password,
  date,
  email,
}

class UpdateEducationStaffFields extends StatefulWidget {
  const UpdateEducationStaffFields({
    super.key,
    required this.appLocalizations,
    required this.snapshot,
    required this.fieldName,
    this.fieldsType = UpdateFieldsType.text,
    this.title,
    this.prefix,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.height = 250,
  });

  final AppLocalizations? appLocalizations;
  final String fieldName;
  final AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot;
  final UpdateFieldsType fieldsType;
  final String? title;
  final IconData? prefix;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final double height;

  @override
  State<UpdateEducationStaffFields> createState() =>
      _UpdateEducationStaffFieldsState();
}

class _UpdateEducationStaffFieldsState
    extends State<UpdateEducationStaffFields> {
  bool isFieldChenged = false;
  bool isPassInNextStep = false;
  final filedFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: widget.height,
      color: Theme.of(context).primaryColorDark,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.05), // 20
        child: FormBuilder(
          key: filedFormKey,
          child: Column(
            children: [
              if (widget.fieldsType == UpdateFieldsType.password)
                if (isPassInNextStep == false)
                  Expanded(
                    flex: 2,
                    child: MyPasswordFormField(
                      width: Get.width,
                      name: widget.fieldName,
                      delay: 0,
                      prefix: Icon(
                        Icons.lock,
                        size: 20,
                      ),
                      label: Text(
                        widget.appLocalizations!.enter(
                          widget.appLocalizations!.the(
                            widget.appLocalizations!.oldPassword,
                          ),
                        ),
                      ),
                      title: widget.appLocalizations!.oldPassword,
                      onChanged: (value) {
                        filedFormKey.currentState!.saveAndValidate();
                        setState(() {
                          isFieldChenged = true;
                        });
                      },
                      keyboardType: TextInputType.visiblePassword,
                      validators: [
                        FormBuilderValidators.required(
                            errorText: widget.appLocalizations!.requiredField),
                        FormBuilderValidators.minLength(
                          8,
                          errorText: widget.appLocalizations!.minLength(
                            8,
                          ),
                        ),
                      ],
                    ),
                  ),
              if (isPassInNextStep)
                Expanded(
                  flex: 2,
                  child: MyPasswordFormField(
                    width: Get.width,
                    name: '${widget.fieldName}new',
                    delay: 0,
                    prefix: Icon(
                      widget.prefix,
                      size: 20,
                    ),
                    label: Text(
                      widget.appLocalizations!.enter(
                        widget.appLocalizations!.the(
                          widget.appLocalizations!.newPassword,
                        ),
                      ),
                    ),
                    title: widget.appLocalizations!.newPassword,
                    onChanged: (value) {
                      filedFormKey.currentState!.saveAndValidate(
                        focusOnInvalid: false,
                      );
                      setState(() {
                        isFieldChenged = filedFormKey.currentState!
                                    .value['${widget.fieldName}new'] !=
                                widget.snapshot.data![widget.fieldName] &&
                            value ==
                                filedFormKey.currentState!
                                    .value['${widget.fieldName}confirm'];
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: widget.appLocalizations!.requiredField),
                      FormBuilderValidators.minLength(
                        8,
                        errorText: widget.appLocalizations!.minLength(
                          8,
                        ),
                      ),
                    ],
                  ),
                ),
              if (isPassInNextStep)
                Expanded(
                  flex: 2,
                  child: MyPasswordFormField(
                    width: Get.width,
                    name: '${widget.fieldName}confirm',
                    delay: 0,
                    prefix: Icon(
                      widget.prefix,
                      size: 20,
                    ),
                    label: Text(
                      widget.appLocalizations!.the(
                        widget.appLocalizations!.confirmNewPassword,
                      ),
                    ),
                    title: widget.appLocalizations!.confirmNewPassword,
                    onChanged: (value) {
                      filedFormKey.currentState!.saveAndValidate();
                      setState(() {
                        isFieldChenged = value ==
                            filedFormKey
                                .currentState!.value['${widget.fieldName}new'];
                        isFieldChenged = filedFormKey.currentState!
                                .value['${widget.fieldName}new'] !=
                            widget.snapshot.data![widget.fieldName];
                      });
                    },
                    keyboardType: TextInputType.visiblePassword,
                    validators: [
                      FormBuilderValidators.required(
                          errorText: widget.appLocalizations!.requiredField),
                      FormBuilderValidators.minLength(
                        8,
                        errorText: widget.appLocalizations!.minLength(
                          8,
                        ),
                      ),
                      if (filedFormKey
                              .currentState!.value['${widget.fieldName}new'] !=
                          null)
                        FormBuilderValidators.equal(
                          filedFormKey
                              .currentState!.value['${widget.fieldName}new'],
                          errorText: widget.appLocalizations!.identicalPassword,
                        )
                    ],
                  ),
                ),
              if (widget.fieldsType == UpdateFieldsType.text ||
                  widget.fieldsType == UpdateFieldsType.email)
                Expanded(
                  flex: 2,
                  child: MyTextFormField(
                    width: Get.width,
                    name: widget.fieldName,
                    delay: 0,
                    onChanged: (value) {
                      filedFormKey.currentState!.saveAndValidate();
                      setState(() {
                        isFieldChenged =
                            value != widget.snapshot.data![widget.fieldName];
                      });
                    },
                    maxLines: widget.maxLines,
                    minLines: widget.minLines,
                    maxLength: widget.maxLength,
                    initialValue: widget.snapshot.data![widget.fieldName],
                    title: widget.title ?? '',
                    keyboardType: widget.fieldsType == UpdateFieldsType.email
                        ? TextInputType.emailAddress
                        : TextInputType.multiline,
                    isRequired: false,
                    label: Text(
                      widget.appLocalizations!.enter(
                        widget.appLocalizations!.the(
                          widget.title ?? '',
                        ),
                      ),
                    ),
                    prefix: Icon(
                      widget.prefix ?? Icons.person_rounded,
                    ),
                    validators: [
                      if (widget.fieldsType == UpdateFieldsType.email)
                        FormBuilderValidators.email(
                          errorText: widget.appLocalizations!.invalidEmail,
                        ),
                    ],
                  ),
                ),
              if (widget.fieldsType == UpdateFieldsType.date)
                Expanded(
                  flex: 2,
                  child: MyDateFormField(
                    width: Get.width,
                    name: widget.fieldName,
                    delay: 0,
                    onChanged: (value) {
                      filedFormKey.currentState!.saveAndValidate();
                      setState(() {
                        isFieldChenged = value !=
                            FormatFounctions.getDateFromString(
                              string: widget.snapshot.data![widget.fieldName],
                            );
                      });
                    },
                    initialValue: FormatFounctions.getDateFromString(
                      string: widget.snapshot.data![widget.fieldName],
                    ),
                    title: widget.title ?? '',
                    keyboardType: TextInputType.datetime,
                    isRequired: false,
                    label: Text(
                      widget.appLocalizations!.enter(
                        widget.appLocalizations!.the(
                          widget.appLocalizations!.birthDate,
                        ),
                      ),
                    ),
                    prefix: Icon(
                      Icons.date_range_rounded,
                    ),
                  ),
                ),
              Expanded(
                flex: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isFieldChenged && filedFormKey.currentState!.isValid
                        ? TextButton(
                            onPressed: () {
                              if (widget.fieldsType ==
                                  UpdateFieldsType.password) {
                                if (filedFormKey.currentState!
                                        .value[widget.fieldName] ==
                                    widget.snapshot.data![widget.fieldName]) {
                                  if (isPassInNextStep) {
                                    EducationStaffController
                                        .updateEducationStaff(
                                            LoginController.educationStaffId, {
                                      widget.fieldName: filedFormKey
                                          .currentState!
                                          .value['${widget.fieldName}new']
                                    });
                                    Get.back();
                                  }
                                  setState(() {
                                    isPassInNextStep = true;
                                    isFieldChenged = false;
                                  });
                                } else {
                                  MyAlert.snackbar(
                                    title: LanguageController
                                                .getCurrentLanguage() ==
                                            "ar"
                                        ? "كلمة السر غير صحيحة"
                                        : "Incorrect Password",
                                    message: LanguageController
                                                .getCurrentLanguage() ==
                                            "ar"
                                        ? "كلمة السر غير صحيحة، حاول مره اخرى"
                                        : "The Password Is Incorrect, Try Again",
                                    backgroundColor:
                                        Color.fromARGB(70, 239, 83, 80),
                                    colorText: Get.theme.primaryColorLight,
                                  );
                                }
                              } else if (widget.fieldsType ==
                                  UpdateFieldsType.date) {
                                EducationStaffController.updateEducationStaff(
                                    LoginController.educationStaffId, {
                                  widget.fieldName:
                                      FormatFounctions.getStringFromDate(
                                    date: filedFormKey
                                        .currentState!.value[widget.fieldName],
                                  )
                                });
                                Get.back();
                              } else {
                                EducationStaffController.updateEducationStaff(
                                    LoginController.educationStaffId, {
                                  widget.fieldName: filedFormKey
                                      .currentState!.value[widget.fieldName]
                                });
                                Get.back();
                              }
                            },
                            child: Text(
                              (widget.fieldsType == UpdateFieldsType.password &&
                                      isPassInNextStep == false)
                                  ? widget.appLocalizations!.next
                                  : widget.appLocalizations!.save,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              (widget.fieldsType == UpdateFieldsType.password &&
                                      isPassInNextStep == false)
                                  ? widget.appLocalizations!.next
                                  : widget.appLocalizations!.save,
                              style: TextStyle(
                                color: isFieldChenged
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(widget.appLocalizations!.cancel),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
