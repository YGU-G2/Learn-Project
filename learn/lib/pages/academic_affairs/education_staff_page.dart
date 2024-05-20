import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn/controller/academic_affairs/education_staff_controller.dart';
import 'package:learn/controller/academic_affairs/permisions_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/models/education_staff.dart';
import 'package:learn/models/permisions.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:learn/utils/my_alert_dialog.dart';
import 'package:learn/utils/my_bottom_sheet.dart';
import 'package:learn/views/my_table/my_data_cell.dart';
import 'package:learn/views/my_table/my_data_column.dart';
import 'package:learn/views/my_table/my_table.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/form/my_check_box_form_field.dart';
import 'package:learn/widgets/form/my_date_form_field.dart';
import 'package:learn/widgets/form/my_password_form_field.dart';
import 'package:learn/widgets/form/my_select_from_field.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:learn/widgets/loading.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/show_info_list_tile.dart';
import 'package:learn/widgets/update_education_staff_fields.dart';

class EducationStaffPage extends StatelessWidget {
  const EducationStaffPage({
    super.key,
    required this.appLocalizations,
  });

  final AppLocalizations? appLocalizations;

  @override
  Widget build(BuildContext context) {
    final educationStaffFormKey = GlobalKey<FormBuilderState>();
    final permisionsFormKey = GlobalKey<FormBuilderState>();
    final searchFormKey = GlobalKey<FormBuilderState>();
    final TableController tableController = Get.find<TableController>();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    void handleAddEducationStaff() async {
      if (educationStaffFormKey.currentState!.saveAndValidate()) {
        Permisions permisions = await PermisionsController.getPermisionById(
          educationStaffFormKey.currentState!.value['educationStaffPermisions'],
        );
        await EducationStaffController.addEducationStaff(
          EducationStaff(
            educationStaffId: Random().nextInt(1000000000).toString(),
            educationStaffName:
                educationStaffFormKey.currentState!.value['educationStaffName'],
            educationStaffAcademicNumber: educationStaffFormKey
                .currentState!.value['educationStaffAcademicNumber'],
            educationStaffAcademicDegree: educationStaffFormKey
                .currentState!.value['educationStaffAcademicDegree'],
            educationStaffGender: educationStaffFormKey
                .currentState!.value['educationStaffGender'],
            educationStaffBirthDate: educationStaffFormKey
                .currentState!.value['educationStaffBirthDate'],
            isEducationStaffDeleted: false,
            educationStaffJobTitle: educationStaffFormKey
                .currentState!.value['educationStaffJobTitle'],
            educationStaffPassword: educationStaffFormKey
                .currentState!.value['educationStaffPassword'],
            educationStaffPermisions: educationStaffFormKey
                .currentState!.value['educationStaffPermisions'],
            educationStaffPermisionName: permisions.permisionName,
            educationStaffAbout: '',
            educationStaffEmail: '',
            educationStaffImage: '',
            isEducationStaffLogined: false,
          ),
        );
      }
    }

    void handleAddPermisions() async {
      if (permisionsFormKey.currentState!.saveAndValidate()) {
        await PermisionsController.addPermisions(
          Permisions(
            permisionId: Random().nextInt(1000000000).toString(),
            permisionName:
                permisionsFormKey.currentState!.value['permisionName'],
            permisionShowUniversityData: permisionsFormKey
                .currentState!.value['permisionShowUniversityData'],
            permisionEditUniversityData: permisionsFormKey
                .currentState!.value['permisionEditUniversityData'],
            permisionShowColleges:
                permisionsFormKey.currentState!.value['permisionShowColleges'],
            permisionAddColleges:
                permisionsFormKey.currentState!.value['permisionAddColleges'],
            permisionEditColleges:
                permisionsFormKey.currentState!.value['permisionEditColleges'],
            permisionDeleteColleges: permisionsFormKey
                .currentState!.value['permisionDeleteColleges'],
            permisionShowNews:
                permisionsFormKey.currentState!.value['permisionShowNews'],
            permisionAddNews:
                permisionsFormKey.currentState!.value['permisionAddNews'],
            permisionEditNews:
                permisionsFormKey.currentState!.value['permisionEditNews'],
            permisionDeleteNews:
                permisionsFormKey.currentState!.value['permisionDeleteNews'],
            permisionShowActivitys:
                permisionsFormKey.currentState!.value['permisionShowActivitys'],
            permisionAddActivitys:
                permisionsFormKey.currentState!.value['permisionAddActivitys'],
            permisionEditActivitys:
                permisionsFormKey.currentState!.value['permisionEditActivitys'],
            permisionDeleteActivitys: permisionsFormKey
                .currentState!.value['permisionDeleteActivitys'],
            permisionShowAcademicStaff: permisionsFormKey
                .currentState!.value['permisionShowAcademicStaff'],
            permisionAddAcademicStaff: permisionsFormKey
                .currentState!.value['permisionAddAcademicStaff'],
            permisionEditAcademicStaff: permisionsFormKey
                .currentState!.value['permisionEditAcademicStaff'],
            permisionDeleteAcademicStaff: permisionsFormKey
                .currentState!.value['permisionDeleteAcademicStaff'],
            isPermisionDeleted: false,
          ),
        );
      }
    }

    void handleEditEducationStaff(EducationStaff editEducationStaff) async {
      if (educationStaffFormKey.currentState!.saveAndValidate()) {
        Permisions permisions = await PermisionsController.getPermisionById(
          educationStaffFormKey.currentState!.value['educationStaffPermisions'],
        );
        await EducationStaffController.editEducationStaff(
          EducationStaff(
            educationStaffId: editEducationStaff.educationStaffId,
            educationStaffName:
                educationStaffFormKey.currentState!.value['educationStaffName'],
            educationStaffAcademicNumber: educationStaffFormKey
                .currentState!.value['educationStaffAcademicNumber'],
            educationStaffAcademicDegree: educationStaffFormKey
                .currentState!.value['educationStaffAcademicDegree'],
            educationStaffGender: educationStaffFormKey
                .currentState!.value['educationStaffGender'],
            educationStaffBirthDate: educationStaffFormKey
                .currentState!.value['educationStaffBirthDate'],
            isEducationStaffDeleted: editEducationStaff.isEducationStaffDeleted,
            educationStaffJobTitle: educationStaffFormKey
                .currentState!.value['educationStaffJobTitle'],
            educationStaffPassword: educationStaffFormKey
                .currentState!.value['educationStaffPassword'],
            educationStaffPermisions: educationStaffFormKey
                .currentState!.value['educationStaffPermisions'],
            educationStaffPermisionName: permisions.permisionName,
            educationStaffAbout: editEducationStaff.educationStaffAbout,
            educationStaffEmail: editEducationStaff.educationStaffEmail,
            educationStaffImage: editEducationStaff.educationStaffImage,
            educationStaffSocialMedia:
                editEducationStaff.educationStaffSocialMedia,
            isEducationStaffLogined: editEducationStaff.isEducationStaffLogined,
          ),
        );
      }
    }

    void handleEditPermisions(Permisions permisions) async {
      if (permisionsFormKey.currentState!.saveAndValidate()) {
        await PermisionsController.editPermisions(
          Permisions(
            permisionId: permisions.permisionId,
            permisionName:
                permisionsFormKey.currentState!.value['permisionName'],
            permisionShowUniversityData: permisionsFormKey
                .currentState!.value['permisionShowUniversityData'],
            permisionEditUniversityData: permisionsFormKey
                .currentState!.value['permisionEditUniversityData'],
            permisionShowColleges:
                permisionsFormKey.currentState!.value['permisionShowColleges'],
            permisionAddColleges:
                permisionsFormKey.currentState!.value['permisionAddColleges'],
            permisionEditColleges:
                permisionsFormKey.currentState!.value['permisionEditColleges'],
            permisionDeleteColleges: permisionsFormKey
                .currentState!.value['permisionDeleteColleges'],
            permisionShowNews:
                permisionsFormKey.currentState!.value['permisionShowNews'],
            permisionAddNews:
                permisionsFormKey.currentState!.value['permisionAddNews'],
            permisionEditNews:
                permisionsFormKey.currentState!.value['permisionEditNews'],
            permisionDeleteNews:
                permisionsFormKey.currentState!.value['permisionDeleteNews'],
            permisionShowActivitys:
                permisionsFormKey.currentState!.value['permisionShowActivitys'],
            permisionAddActivitys:
                permisionsFormKey.currentState!.value['permisionAddActivitys'],
            permisionEditActivitys:
                permisionsFormKey.currentState!.value['permisionEditActivitys'],
            permisionDeleteActivitys: permisionsFormKey
                .currentState!.value['permisionDeleteActivitys'],
            permisionShowAcademicStaff: permisionsFormKey
                .currentState!.value['permisionShowAcademicStaff'],
            permisionAddAcademicStaff: permisionsFormKey
                .currentState!.value['permisionAddAcademicStaff'],
            permisionEditAcademicStaff: permisionsFormKey
                .currentState!.value['permisionEditAcademicStaff'],
            permisionDeleteAcademicStaff: permisionsFormKey
                .currentState!.value['permisionDeleteAcademicStaff'],
            isPermisionDeleted: permisions.isPermisionDeleted,
          ),
        );
      }
    }

    void handleDeleteEducationStaff(
        QueryDocumentSnapshot<Map<String, dynamic>> document) {
      MyAlertDialog.showMyAlertDialog(
        appLocalizations: appLocalizations!,
        icon: Icons.warning_amber_rounded,
        whoDelete: document['educationStaffName'],
        iconColor: Colors.red,
        title: appLocalizations!.warningMessage,
        onYesBtnPressed: () {
          Get.back();
          EducationStaffController.educationStaffWaitingBtn.value = document.id;
          EducationStaffController.deleteEducationStaff(
            educationStaffId: document.id,
          );
        },
      );
    }

    void handleDeletePermision(
        QueryDocumentSnapshot<Map<String, dynamic>> document) {
      MyAlertDialog.showMyAlertDialog(
        appLocalizations: appLocalizations!,
        icon: Icons.warning_amber_rounded,
        whoDelete: document['permisionName'],
        iconColor: Colors.red,
        title: appLocalizations!.warningMessage,
        onYesBtnPressed: () {
          Get.back();
          PermisionsController.deletePermisions(
            permisionId: document.id,
          );
        },
      );
    }

    void _onEducationStaffFieldsChanges(String name) {
      educationStaffFormKey.currentState!.fields[name]!.validate(
        focusOnInvalid: false,
      );
    }

    void _onPermisionsFieldsChanges(String name) {
      permisionsFormKey.currentState!.fields[name]!.validate(
        focusOnInvalid: false,
      );
    }

    bool _isEducationStaffDataEdit({required EducationStaff educationStaff}) {
      educationStaffFormKey.currentState!.save();
      if (educationStaff.educationStaffName ==
              educationStaffFormKey.currentState!.value['educationStaffName']
                  .toString() &&
          educationStaff.educationStaffAcademicNumber ==
              educationStaffFormKey
                  .currentState!.value['educationStaffAcademicNumber'] &&
          educationStaff.educationStaffAcademicDegree ==
              educationStaffFormKey
                  .currentState!.value['educationStaffAcademicDegree'] &&
          educationStaff.educationStaffGender ==
              educationStaffFormKey
                  .currentState!.value['educationStaffGender'] &&
          educationStaff.educationStaffBirthDate ==
              educationStaffFormKey
                  .currentState!.value['educationStaffBirthDate']) {
        return false;
      } else {
        return true;
      }
    }

    bool _isPermisionDataEdit({required Permisions permisions}) {
      permisionsFormKey.currentState!.save();
      if (permisions.permisionName ==
              permisionsFormKey.currentState!.value['permisionName']
                  .toString() &&
          permisions.permisionShowUniversityData ==
              permisionsFormKey
                  .currentState!.value['permisionShowUniversityData'] &&
          permisions.permisionEditUniversityData ==
              permisionsFormKey
                  .currentState!.value['permisionEditUniversityData'] &&
          permisions.permisionShowColleges ==
              permisionsFormKey.currentState!.value['permisionShowColleges'] &&
          permisions.permisionAddColleges ==
              permisionsFormKey.currentState!.value['permisionAddColleges'] &&
          permisions.permisionEditColleges ==
              permisionsFormKey.currentState!.value['permisionEditColleges'] &&
          permisions.permisionDeleteColleges ==
              permisionsFormKey
                  .currentState!.value['permisionDeleteColleges'] &&
          permisions.permisionShowNews ==
              permisionsFormKey.currentState!.value['permisionShowNews'] &&
          permisions.permisionAddNews ==
              permisionsFormKey.currentState!.value['permisionAddNews'] &&
          permisions.permisionEditNews ==
              permisionsFormKey.currentState!.value['permisionEditNews'] &&
          permisions.permisionDeleteNews ==
              permisionsFormKey.currentState!.value['permisionDeleteNews'] &&
          permisions.permisionShowActivitys ==
              permisionsFormKey.currentState!.value['permisionShowActivitys'] &&
          permisions.permisionAddActivitys ==
              permisionsFormKey.currentState!.value['permisionAddActivitys'] &&
          permisions.permisionEditActivitys ==
              permisionsFormKey.currentState!.value['permisionEditActivitys'] &&
          permisions.permisionDeleteActivitys ==
              permisionsFormKey
                  .currentState!.value['permisionDeleteActivitys'] &&
          permisions.permisionShowAcademicStaff ==
              permisionsFormKey
                  .currentState!.value['permisionShowAcademicStaff'] &&
          permisions.permisionAddAcademicStaff ==
              permisionsFormKey
                  .currentState!.value['permisionAddAcademicStaff'] &&
          permisions.permisionEditAcademicStaff ==
              permisionsFormKey
                  .currentState!.value['permisionEditAcademicStaff'] &&
          permisions.permisionDeleteAcademicStaff ==
              permisionsFormKey
                  .currentState!.value['permisionDeleteAcademicStaff']) {
        return false;
      } else {
        return true;
      }
    }

    void _onEducationStaffEdit(bool isAdd, EducationStaff? educationStaff) {
      if (!isAdd) {
        EducationStaffController.isEducationStaffEditBtnEnable.value =
            _isEducationStaffDataEdit(educationStaff: educationStaff!);
      }
    }

    void _onPermisionEdit(bool isAdd, Permisions? permisions) {
      if (!isAdd) {
        PermisionsController.isPermisionEditBtnEnable.value =
            _isPermisionDataEdit(permisions: permisions!);
      }
    }

    Widget _checkBoxField({
      required bool isShow,
      required bool isAdd,
      required String name,
      required bool permision,
      required String title,
      required int delay,
      required Permisions? permisions,
    }) {
      return isShow
          ? FadeInRight(
              delay: Duration(milliseconds: delay),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.025),
                child: Row(
                  children: [
                    permision
                        ? Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.close_rounded,
                            color: Colors.red,
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: Get.width * 0.040,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : MyCheckBoxFormField(
              title: title,
              name: name,
              delay: delay,
              width: Get.width,
              initialValue: isAdd ? false : permision,
              onChanged: (value) {
                _onPermisionEdit(isAdd, permisions);
                _onPermisionsFieldsChanges(
                  name,
                );
              },
            );
    }

    void _permisionDialog({
      required bool isAdd,
      Permisions? permisions,
      bool isShow = false,
    }) {
      PermisionsController.isPermisionEditBtnEnable.value = false;
      if (isAdd) {
        PermisionsController.isPermisionEditBtnEnable.value = true;
      }

      showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: LanguageController.getCurrentLanguage() == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: AlertDialog(
              buttonPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              backgroundColor: Get.theme.primaryColorDark,
              shadowColor: Get.theme.colorScheme.shadow,
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05,
                vertical: Get.height * 0.05,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              title: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 50,
                    right: LanguageController.getCurrentLanguage() == "ar"
                        ? 8
                        : null,
                    left: LanguageController.getCurrentLanguage() == "ar"
                        ? null
                        : 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.zero,
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: Get.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: BodyTitle(
                      title: isAdd
                          ? appLocalizations!.add(
                              appLocalizations!.permision,
                            )
                          : isShow
                              ? appLocalizations!.display(
                                  appLocalizations!.permision,
                                )
                              : appLocalizations!.editWord(
                                  appLocalizations!.permision,
                                ),
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: Get.width - (Get.width * 0.146),
                height: Get.height / 1.37,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Get.width * 0.05,
                    left: Get.width * 0.05,
                    bottom: Get.width * 0.05,
                  ),
                  child: FormBuilder(
                    key: permisionsFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isShow
                              ? Column(
                                  children: [
                                    FadeInDown(
                                      delay: Duration(milliseconds: 550),
                                      curve: Curves.fastOutSlowIn,
                                      duration: Duration(milliseconds: 500),
                                      child: Text(
                                        appLocalizations!.title,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          fontSize: Get.width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    FadeInRight(
                                      delay: Duration(milliseconds: 600),
                                      curve: Curves.fastOutSlowIn,
                                      duration: Duration(milliseconds: 500),
                                      child: Text(
                                        permisions!.permisionName,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .primaryColorLight,
                                          fontSize: Get.width * 0.040,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : MyTextFormField(
                                  width: Get.width,
                                  name: "permisionName",
                                  delay: 600,
                                  initialValue:
                                      isAdd ? null : permisions!.permisionName,
                                  onChanged: (value) {
                                    _onPermisionEdit(
                                      isAdd,
                                      permisions,
                                    );
                                    _onPermisionsFieldsChanges(
                                      "permisionName",
                                    );
                                  },
                                  readOnly: isShow,
                                  title: appLocalizations!.title,
                                  isRequired: true,
                                  keyboardType: TextInputType.name,
                                  label: Text(
                                    appLocalizations!.enter(
                                      appLocalizations!.the(
                                        appLocalizations!.permisionTitle,
                                      ),
                                    ),
                                  ),
                                  prefix: Icon(
                                    Icons.person,
                                  ),
                                  validators: [
                                    FormBuilderValidators.required(
                                      errorText:
                                          appLocalizations!.requiredField,
                                    ),
                                    FormBuilderValidators.minLength(
                                      3,
                                      allowEmpty: false,
                                      errorText: appLocalizations!.minLength(3),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeInDown(
                            delay: Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              "- ${appLocalizations!.dashboardPermisions}",
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: Get.width * 0.040,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionShowUniversityData,
                            name: 'permisionShowUniversityData',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.showUniversityData,
                            delay: 800,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionEditUniversityData,
                            name: 'permisionEditUniversityData',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.editUniversityData,
                            delay: 850,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionShowColleges,
                            name: 'permisionShowColleges',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.showColleges,
                            delay: 900,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionAddColleges,
                            name: 'permisionAddColleges',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.addColleges,
                            delay: 950,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionEditColleges,
                            name: 'permisionEditColleges',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.editColleges,
                            delay: 1000,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionDeleteColleges,
                            name: 'permisionDeleteColleges',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.deleteColleges,
                            delay: 1050,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision:
                                isAdd ? false : permisions!.permisionShowNews,
                            name: 'permisionShowNews',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.showNews,
                            delay: 1100,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision:
                                isAdd ? false : permisions!.permisionAddNews,
                            name: 'permisionAddNews',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.addNews,
                            delay: 1150,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision:
                                isAdd ? false : permisions!.permisionEditNews,
                            name: 'permisionEditNews',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.editNews,
                            delay: 1200,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision:
                                isAdd ? false : permisions!.permisionDeleteNews,
                            name: 'permisionDeleteNews',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.deleteNews,
                            delay: 1250,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionShowActivitys,
                            name: 'permisionShowActivitys',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.showActivitys,
                            delay: 1300,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionAddActivitys,
                            name: 'permisionAddActivitys',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.addActivitys,
                            delay: 1350,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionEditActivitys,
                            name: 'permisionEditActivitys',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.editActivitys,
                            delay: 1400,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionDeleteActivitys,
                            name: 'permisionDeleteActivitys',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.deleteActivitys,
                            delay: 1450,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeInDown(
                            delay: Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              "- ${appLocalizations!.acadmeicAffairsPermisions}",
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                                fontSize: Get.width * 0.040,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionShowAcademicStaff,
                            name: 'permisionShowAcademicStaff',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.showAcademicStaff,
                            delay: 1300,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionAddAcademicStaff,
                            name: 'permisionAddAcademicStaff',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.addAcademicStaff,
                            delay: 1350,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionEditAcademicStaff,
                            name: 'permisionEditAcademicStaff',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.editAcademicStaff,
                            delay: 1400,
                          ),
                          _checkBoxField(
                            permisions: permisions,
                            permision: isAdd
                                ? false
                                : permisions!.permisionDeleteAcademicStaff,
                            name: 'permisionDeleteAcademicStaff',
                            isAdd: isAdd,
                            isShow: isShow,
                            title: appLocalizations!.deleteAcademicStaff,
                            delay: 1450,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (!isShow)
                            FlipInY(
                              delay: Duration(milliseconds: 1100),
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(milliseconds: 500),
                              child: Obx(
                                () => MyButton(
                                  width: Get.width,
                                  isEnable: PermisionsController
                                          .isPermisionEditBtnEnable.value
                                      ? !PermisionsController
                                          .isAddAndEditPermisionIsLoading.value
                                      : false,
                                  onPressed: () {
                                    if (isAdd) {
                                      handleAddPermisions();
                                    } else {
                                      handleEditPermisions(
                                        permisions!,
                                      );
                                    }
                                  },
                                  elevation: 5,
                                  child: PermisionsController
                                          .isAddAndEditPermisionIsLoading.value
                                      ? Loading.getCubeGrid()
                                      : Text(
                                          isAdd
                                              ? appLocalizations!.add("")
                                              : appLocalizations!.editWord(""),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                            fontSize: Get.width * 0.040,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          if (!isShow)
                            SizedBox(
                              height: 20,
                            ),
                          if (!isShow)
                            FlipInY(
                              delay: Duration(milliseconds: 1100),
                              curve: Curves.fastOutSlowIn,
                              duration: Duration(milliseconds: 500),
                              child: Obx(
                                () => MyButton(
                                  width: Get.width,
                                  isEnable: !PermisionsController
                                      .isAddAndEditPermisionIsLoading.value,
                                  onPressed: () =>
                                      permisionsFormKey.currentState!.reset(),
                                  elevation: 5,
                                  child: Text(
                                    appLocalizations!.emptying,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontSize: Get.width * 0.040,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (!isShow)
                            SizedBox(
                              height: 20,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    void showEduactionStaff({required String educationStaffId}) {
      MyBottomSheet.getBottomSheet(
        content: Container(
          color: Theme.of(context).primaryColorDark,
          height: Get.height / 1.3,
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: _firestore
                    .collection('education_staff')
                    .doc(educationStaffId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return SizedBox(
                      width: Get.width,
                      height: Get.height - 90,
                      child: Center(
                        child: Loading.getCubeGrid(
                          size: Get.width * 0.0975,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return MyAlert.snackbar(
                      title: LanguageController.getCurrentLanguage() == "ar"
                          ? "خطاء"
                          : "Error",
                      message: LanguageController.getCurrentLanguage() == "ar"
                          ? "خطاء في تحميل البيانات"
                          : "Error In Loading Data",
                      backgroundColor: Color.fromARGB(70, 239, 83, 80),
                      colorText: Get.theme.primaryColorLight,
                    );
                  }
                  return Column(
                    children: [
                      FlipInY(
                        delay: const Duration(milliseconds: 700),
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          appLocalizations!.profileImage,
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
                        child: OfflineBuilder(
                          connectivityBuilder: (
                            BuildContext context,
                            ConnectivityResult connectivity,
                            Widget child,
                          ) {
                            CheckInternetConnection.checkTheInternet();
                            if (CheckInternetConnection
                                    .isInternetOnLine.value &&
                                snapshot.data!['educationStaffImage']
                                    .isNotEmpty) {
                              return CircleAvatar(
                                radius: Get.width * 0.220, // 90
                                backgroundImage: NetworkImage(
                                  "${snapshot.data!['educationStaffImage']}",
                                ),
                                onBackgroundImageError:
                                    (exception, stackTrace) => Icon(
                                  CupertinoIcons.person,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface,
                                  size: Get.width * 0.220, // 90
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                              );
                            } else {
                              return CircleAvatar(
                                radius: Get.width * 0.220, // 90
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary,
                                child: Icon(
                                  CupertinoIcons.person,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface,
                                  size: Get.width * 0.220, // 90
                                ),
                              );
                            }
                          },
                          child: Loading.getCubeGrid(
                            size: Get.width * 0.062, //25
                          ),
                        ),
                        ),
                      SizedBox(
                        height: 20,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.name,
                        text: "${snapshot.data!['educationStaffName']}",
                        icon: Icons.person_rounded,
                        showEditBtn: false,
                        delay: 1100,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.academicNumber,
                        text:
                            "${snapshot.data!['educationStaffAcademicNumber']}",
                        icon: Icons.person_rounded,
                        showEditBtn: false,
                        delay: 1150,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.academicDegree,
                        text: EducationStaffController
                            .getEducationStaffAcademicDegree(
                          educationStaffAcademicDegree:
                              "${snapshot.data!['educationStaffAcademicDegree']}",
                          appLocalizations: appLocalizations!,
                        ),
                        icon: Icons.school_rounded,
                        showEditBtn: false,
                        delay: 1200,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.gender,
                        text: EducationStaffController.getEducationStaffGender(
                          educationStaffGender:
                              "${snapshot.data!['educationStaffGender']}",
                          appLocalizations: appLocalizations!,
                        ),
                        icon: Icons.group_outlined,
                        showEditBtn: false,
                        delay: 1250,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.birthDate,
                        text: snapshot.data!['educationStaffBirthDate'],
                        icon: Icons.date_range_rounded,
                        delay: 1300,
                        showEditBtn: false,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.jobTitle,
                        text:
                            EducationStaffController.getEducationStaffJobTitle(
                          educationStaffJobTitle:
                              "${snapshot.data!['educationStaffJobTitle']}",
                          appLocalizations: appLocalizations!,
                        ),
                        icon: Icons.work_rounded,
                        showEditBtn: false,
                        delay: 1350,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.email,
                        text: "${snapshot.data!['educationStaffEmail']}",
                        icon: Icons.email_rounded,
                        delay: 1400,
                        showEditBtn: false,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.aboutYou,
                        text: "${snapshot.data!['educationStaffAbout']}",
                        icon: Icons.person_pin_rounded,
                        delay: 1450,
                        showEditBtn: false,
                      ),
                      ShowInfoListTile(
                        appLocalizations: appLocalizations!,
                        title: appLocalizations!.communication,
                        child: Row(
                          children: List.generate(
                            snapshot.data!['educationStaffSocialMedia'] == null
                                ? 0
                                : snapshot
                                    .data!['educationStaffSocialMedia'].length,
                            (index) => TextButton(
                              onPressed: () {},
                              child: Brand(
                                Brands.facebook,
                              ),
                            ),
                          ),
                        ),
                        icon: Icons.contacts_rounded,
                        showEditBtn: false,
                        delay: 1450,
                      ),
                    ],
                  );
                }),
          ),
        ),
      );
    }

    Future<void> _getPermisionData(
        {required String permisionId, bool isShow = false}) async {
      PermisionsController.isPermisionOperationWaiting.value = true;
      Permisions permisions = await PermisionsController.getPermisionById(
        permisionId,
      );
      _permisionDialog(
        isAdd: false,
        permisions: permisions,
        isShow: isShow,
      );
      PermisionsController.isPermisionOperationWaiting.value = false;
    }

    void _educationStaffAddEditDialog({
      required bool isAdd,
      EducationStaff? educationStaff,
    }) async {
      EducationStaffController.isEducationStaffEditBtnEnable.value = false;
      if (isAdd) {
        EducationStaffController.isEducationStaffEditBtnEnable.value = true;
      }
      showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: LanguageController.getCurrentLanguage() == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: AlertDialog(
              buttonPadding: EdgeInsets.zero,
              actionsPadding: EdgeInsets.zero,
              backgroundColor: Get.theme.primaryColorDark,
              shadowColor: Get.theme.colorScheme.shadow,
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05,
                vertical: Get.height * 0.05,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Get.theme.colorScheme.onBackground,
                ),
              ),
              title: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 50,
                    right: LanguageController.getCurrentLanguage() == "ar"
                        ? 8
                        : null,
                    left: LanguageController.getCurrentLanguage() == "ar"
                        ? null
                        : 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.zero,
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close_rounded,
                          color: Get.theme.colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                  FadeInDown(
                    delay: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 500),
                    child: BodyTitle(
                      title: isAdd
                          ? appLocalizations!.add(
                              appLocalizations!.oneEducationStaff,
                            )
                          : appLocalizations!.editWord(
                              appLocalizations!.oneEducationStaff,
                            ),
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Get.width * 0.05,
                    left: Get.width * 0.05,
                    bottom: Get.width * 0.05,
                  ),
                  child: FormBuilder(
                    key: educationStaffFormKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          MyTextFormField(
                            width: Get.width,
                            name: "educationStaffName",
                            delay: 600,
                            initialValue: isAdd
                                ? null
                                : educationStaff!.educationStaffName,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                              _onEducationStaffFieldsChanges(
                                "educationStaffName",
                              );
                            },
                            title: appLocalizations!.name,
                            isRequired: true,
                            keyboardType: TextInputType.name,
                            label: Text(
                              appLocalizations!.enter(
                                appLocalizations!.the(
                                  appLocalizations!.name,
                                ),
                              ),
                            ),
                            prefix: Icon(
                              Icons.person,
                            ),
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations!.requiredField,
                              ),
                              FormBuilderValidators.minLength(
                                3,
                                allowEmpty: false,
                                errorText: appLocalizations!.minLength(3),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextFormField(
                            width: Get.width,
                            name: "educationStaffAcademicNumber",
                            delay: 700,
                            initialValue: isAdd
                                ? null
                                : educationStaff!.educationStaffAcademicNumber,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                              _onEducationStaffFieldsChanges(
                                "educationStaffAcademicNumber",
                              );
                            },
                            title: appLocalizations!.academicNumber,
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            label: Text(
                              appLocalizations!.enter(
                                appLocalizations!.the(
                                  appLocalizations!.academicNumber,
                                ),
                              ),
                            ),
                            prefix: Icon(
                              Icons.person,
                            ),
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations!.requiredField,
                              ),
                              FormBuilderValidators.numeric(
                                errorText: appLocalizations!.onlyNumbers,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MySelectFormField(
                            width: Get.width,
                            name: "educationStaffAcademicDegree",
                            delay: 800,
                            initialValue: isAdd
                                ? null
                                : educationStaff!.educationStaffAcademicDegree,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                              _onEducationStaffFieldsChanges(
                                "educationStaffAcademicDegree",
                              );
                            },
                            title: appLocalizations!.academicDegree,
                            isRequired: true,
                            label: Text(
                              appLocalizations!.choose(
                                appLocalizations!.the(
                                  appLocalizations!.academicDegree,
                                ),
                              ),
                            ),
                            prefix: Icon(
                              Icons.school_rounded,
                            ),
                            options: [
                              {"Professor": appLocalizations!.professor},
                              {"Doctorate": appLocalizations!.doctorate},
                              {"bachelor": appLocalizations!.bachelor},
                            ],
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations!.requiredField,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MySelectFormField(
                            width: Get.width,
                            name: "educationStaffGender",
                            delay: 900,
                            initialValue: isAdd
                                ? null
                                : educationStaff!.educationStaffGender,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                              _onEducationStaffFieldsChanges(
                                "educationStaffGender",
                              );
                            },
                            title: appLocalizations!.gender,
                            isRequired: true,
                            label: Text(
                              appLocalizations!.choose(
                                appLocalizations!.the(
                                  appLocalizations!.gender,
                                ),
                              ),
                            ),
                            prefix: Icon(
                              Icons.people_rounded,
                            ),
                            options: [
                              {"male": appLocalizations!.male},
                              {"female": appLocalizations!.female},
                            ],
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations!.requiredField,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MySelectFormField(
                            width: Get.width,
                            name: "educationStaffJobTitle",
                            delay: 950,
                            initialValue: isAdd
                                ? null
                                : educationStaff!.educationStaffJobTitle,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                              _onEducationStaffFieldsChanges(
                                "educationStaffJobTitle",
                              );
                            },
                            title: appLocalizations!.jobTitle,
                            isRequired: true,
                            label: Text(
                              appLocalizations!.choose(
                                appLocalizations!.the(
                                  appLocalizations!.jobTitle,
                                ),
                              ),
                            ),
                            prefix: Icon(
                              Icons.work_rounded,
                            ),
                            options: [
                              {"Professor": appLocalizations!.professor},
                              {"Teacher": appLocalizations!.teacher},
                              {"Doctor": appLocalizations!.doctor},
                            ],
                            validators: [
                              FormBuilderValidators.required(
                                errorText: appLocalizations!.requiredField,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyDateFormField(
                            width: Get.width,
                            name: "educationStaffBirthDate",
                            delay: 1000,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                            },
                            initialValue: isAdd
                                ? null
                                : educationStaff!.educationStaffBirthDate,
                            title: appLocalizations!.birthDate,
                            keyboardType: TextInputType.datetime,
                            isRequired: false,
                            label: Text(
                              appLocalizations!.enter(
                                appLocalizations!.the(
                                  appLocalizations!.birthDate,
                                ),
                              ),
                            ),
                            prefix: Icon(
                              Icons.date_range_rounded,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyPasswordFormField(
                            width: Get.width,
                            name: "educationStaffPassword",
                            delay: 1050,
                            prefix: Icon(
                              Icons.lock,
                              size: 20,
                            ),
                            title: appLocalizations!.password,
                            onChanged: (value) {
                              _onEducationStaffEdit(isAdd, educationStaff);
                              _onEducationStaffFieldsChanges(
                                "educationStaffPassword",
                              );
                            },
                            initialValue: isAdd
                                ? "00000000"
                                : educationStaff!.educationStaffPassword,
                            label: Text(
                              appLocalizations!.enter(
                                appLocalizations!.the(
                                  appLocalizations!.password,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            validators: [
                              FormBuilderValidators.minLength(
                                8,
                                errorText: appLocalizations!.minLength(
                                  8,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('permisions')
                                    .where(
                                      'isPermisionDeleted',
                                      isEqualTo: false,
                                    )
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) {
                                    return SizedBox(
                                      width: Get.width,
                                      height: Get.height / 2,
                                      child: Center(
                                        child: Loading.getCubeGrid(
                                          size: Get.width * 0.0975,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                    );
                                  }
                                  if (snapshot.hasError) {
                                    return MyAlert.snackbar(
                                      title: LanguageController
                                                  .getCurrentLanguage() ==
                                              "ar"
                                          ? "خطاء"
                                          : "Error",
                                      message: LanguageController
                                                  .getCurrentLanguage() ==
                                              "ar"
                                          ? "خطاء في تحميل البيانات"
                                          : "Error In Loading Data",
                                      backgroundColor:
                                          Color.fromARGB(70, 239, 83, 80),
                                      colorText: Get.theme.primaryColorLight,
                                    );
                                  }
                                  return MySelectFormField(
                                    width: 250,
                                    name: "educationStaffPermisions",
                                    delay: 950,
                                    initialValue: isAdd
                                        ? null
                                        : educationStaff!
                                            .educationStaffPermisions,
                                    onChanged: (value) {
                                      _onEducationStaffEdit(
                                          isAdd, educationStaff);
                                      _onEducationStaffFieldsChanges(
                                        "educationStaffPermisions",
                                      );
                                    },
                                    title: appLocalizations!.permisions,
                                    isRequired: true,
                                    label: Text(
                                      appLocalizations!.choose(
                                        appLocalizations!.the(
                                          appLocalizations!.permisions,
                                        ),
                                      ),
                                    ),
                                    prefix: Icon(
                                      Icons.person_rounded,
                                    ),
                                    options: snapshot.data!.docs
                                        .map(
                                          (document) => {
                                            document.id: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    document['permisionName'],
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.width * 0.040,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Obx(
                                                    () => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            width: 30,
                                                            height: 30,
                                                            child: TextButton(
                                                              style:
                                                                  ButtonStyle(
                                                                padding:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  EdgeInsets
                                                                      .zero,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                PermisionsController
                                                                    .isPermisionOperationType
                                                                    .value = "show";
                                                                PermisionsController
                                                                        .isPermisionOperationId
                                                                        .value =
                                                                    document.id;
                                                                if (PermisionsController
                                                                    .isPermisionOperationWaiting
                                                                    .value) {
                                                                  return;
                                                                }

                                                                Get.back();
                                                                _getPermisionData(
                                                                  permisionId:
                                                                      document
                                                                          .id,
                                                                  isShow: true,
                                                                );
                                                              },
                                                              child: PermisionsController
                                                                          .isPermisionOperationWaiting
                                                                          .value &&
                                                                      PermisionsController
                                                                              .isPermisionOperationType
                                                                              .value ==
                                                                          "show" &&
                                                                      PermisionsController
                                                                              .isPermisionOperationId
                                                                              .value ==
                                                                          document
                                                                              .id
                                                                  ? Loading
                                                                      .getCubeGrid(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .remove_red_eye,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onPrimary,
                                                                      size: Get
                                                                              .width *
                                                                          0.05,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(
                                                            width: 30,
                                                            height: 30,
                                                            child: TextButton(
                                                              style:
                                                                  ButtonStyle(
                                                                padding:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  EdgeInsets
                                                                      .zero,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                PermisionsController
                                                                    .isPermisionOperationType
                                                                    .value = "edit";
                                                                PermisionsController
                                                                        .isPermisionOperationId
                                                                        .value =
                                                                    document.id;
                                                                if (PermisionsController
                                                                    .isPermisionOperationWaiting
                                                                    .value) {
                                                                  return;
                                                                }
                                                                Get.back();
                                                                _getPermisionData(
                                                                  permisionId:
                                                                      document
                                                                          .id,
                                                                );
                                                              },
                                                              child: PermisionsController
                                                                          .isPermisionOperationWaiting
                                                                          .value &&
                                                                      PermisionsController
                                                                              .isPermisionOperationType
                                                                              .value ==
                                                                          "edit" &&
                                                                      PermisionsController
                                                                              .isPermisionOperationId
                                                                              .value ==
                                                                          document
                                                                              .id
                                                                  ? Loading
                                                                      .getCubeGrid(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .edit_rounded,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onPrimary,
                                                                      size: Get
                                                                              .width *
                                                                          0.05,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: SizedBox(
                                                            width: 30,
                                                            height: 30,
                                                            child: TextButton(
                                                              style:
                                                                  ButtonStyle(
                                                                padding:
                                                                    MaterialStateProperty
                                                                        .all(
                                                                  EdgeInsets
                                                                      .zero,
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                PermisionsController
                                                                        .isPermisionOperationType
                                                                        .value =
                                                                    "delete";
                                                                PermisionsController
                                                                        .isPermisionOperationId
                                                                        .value =
                                                                    document.id;
                                                                if (PermisionsController
                                                                    .isPermisionOperationWaiting
                                                                    .value) {
                                                                  return;
                                                                }
                                                                Get.back();
                                                                handleDeletePermision(
                                                                  document,
                                                                );
                                                              },
                                                              child: PermisionsController
                                                                          .isPermisionOperationWaiting
                                                                          .value &&
                                                                      PermisionsController
                                                                              .isPermisionOperationType
                                                                              .value ==
                                                                          "delete" &&
                                                                      PermisionsController
                                                                              .isPermisionOperationId
                                                                              .value ==
                                                                          document
                                                                              .id
                                                                  ? Loading
                                                                      .getCubeGrid(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .primary,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .delete_rounded,
                                                                      color: Theme.of(
                                                                              context)
                                                                          .colorScheme
                                                                          .onPrimary,
                                                                      size: Get
                                                                              .width *
                                                                          0.05,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          },
                                        )
                                        .toList(),
                                    validators: [
                                      FormBuilderValidators.required(
                                        errorText:
                                            appLocalizations!.requiredField,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 25),
                                child: FlipInY(
                                  delay: Duration(milliseconds: 1000),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: MyButton(
                                    elevation: 5,
                                    width: 70,
                                    height: 60,
                                    onPressed: () {
                                      _permisionDialog(isAdd: true);
                                    },
                                    child: Icon(
                                      Icons.add_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlipInY(
                            delay: Duration(milliseconds: 1100),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Obx(
                              () => MyButton(
                                width: Get.width,
                                isEnable: EducationStaffController
                                        .isEducationStaffEditBtnEnable.value
                                    ? !EducationStaffController
                                        .isAddAndEditEducationStaffIsLoading
                                        .value
                                    : false,
                                onPressed: () {
                                  if (isAdd) {
                                    handleAddEducationStaff();
                                  } else {
                                    handleEditEducationStaff(
                                      educationStaff!,
                                    );
                                  }
                                },
                                elevation: 5,
                                child: EducationStaffController
                                        .isAddAndEditEducationStaffIsLoading
                                        .value
                                    ? Loading.getCubeGrid()
                                    : Text(
                                        isAdd
                                            ? appLocalizations!.add("")
                                            : appLocalizations!.editWord(""),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                          fontSize: Get.width * 0.040,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FlipInY(
                            delay: Duration(milliseconds: 1100),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Obx(
                              () => MyButton(
                                width: Get.width,
                                isEnable: !EducationStaffController
                                    .isAddAndEditEducationStaffIsLoading.value,
                                onPressed: () =>
                                    educationStaffFormKey.currentState!.reset(),
                                elevation: 5,
                                child: Text(
                                  appLocalizations!.emptying,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: Get.width * 0.040,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    Future<void> _getEducationStaffEditData(
        {required String educationStaffId}) async {
      EducationStaffController.isEducationStaffOperationWaiting.value = true;
      EducationStaff educationStaff =
          await EducationStaffController.getEducationStaffById(
        educationStaffId,
      );
      _educationStaffAddEditDialog(
        isAdd: false,
        educationStaff: educationStaff,
      );
      EducationStaffController.isEducationStaffOperationWaiting.value = false;
    }

    return ListView(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: BodyTitle(
            title: appLocalizations!.educationStaff,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlipInY(
              delay: Duration(milliseconds: 700),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.037),
                child: MyButton(
                  width: Get.width * 0.3,
                  onPressed: () => _educationStaffAddEditDialog(
                    isAdd: true,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations!.addNew,
                        style: TextStyle(
                          fontSize: Get.width * 0.035,
                          color: Get.theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.person_add_rounded,
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        FadeIn(
          delay: Duration(milliseconds: 900),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: Obx(
            () => StreamBuilder(
              stream: EducationStaffController.getEducationStaffData(
                EducationStaffController.educationStaffSearchValue,
              ),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return SizedBox(
                    width: Get.width,
                    height: Get.height / 2,
                    child: Center(
                      child: Loading.getCubeGrid(
                        size: Get.width * 0.0975,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return MyAlert.snackbar(
                    title: LanguageController.getCurrentLanguage() == "ar"
                        ? "خطاء"
                        : "Error",
                    message: LanguageController.getCurrentLanguage() == "ar"
                        ? "خطاء في تحميل البيانات"
                        : "Error In Loading Data",
                    backgroundColor: Color.fromARGB(70, 239, 83, 80),
                    colorText: Get.theme.primaryColorLight,
                  );
                }
                return MyTable(
                  isWaiting:
                      snapshot.connectionState == ConnectionState.waiting,
                  animatedDelay: 1300,
                  appLocalizations: appLocalizations!,
                  hasData: snapshot.data!.docs.isEmpty,
                  index: 1,
                  isPaginatedData: true,
                  rowPerPagesNumber: 10,
                  header: Center(
                    child: Text(
                      appLocalizations!.all(appLocalizations!.educationStaff),
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  enableSelectedColumn: true,
                  rowsNumbering: true,
                  canSortByColumns: true,
                  showHeader: true,
                  deleteAllBtn: TextButton(
                    onPressed: () {
                      MyAlertDialog.showMyAlertDialog(
                        appLocalizations: appLocalizations!,
                        icon: Icons.warning_amber_rounded,
                        whoDelete:
                            "${tableController.getSelectedCount(1)} ${appLocalizations!.ofRows}",
                        iconColor: Colors.red,
                        title: appLocalizations!.warningMessage,
                        onYesBtnPressed: () {
                          Get.back();
                          List<String> educationStaffIds = [];
                          for (var i = 0;
                              i < tableController.getRowsLength(1);
                              i++) {
                            if (tableController.getRow(1)[i]['isSelected']) {
                              educationStaffIds.add(
                                tableController.getRow(1)[i]['id'],
                              );
                            }
                          }
                          EducationStaffController.deleteAllEducationStaff(
                            educationStaffIds: educationStaffIds,
                          );
                        },
                      );
                    },
                    child: Text(
                      appLocalizations!.deleteAll,
                    ),
                  ),
                  hasSearchField: true,
                  searchField: FormBuilder(
                    key: searchFormKey,
                    child: MyTextFormField(
                      name: "educationStaffSearch",
                      onChanged: (value) {
                        searchFormKey.currentState!.save();
                        if (value != null && value.isNotEmpty) {
                          EducationStaffController
                              .educationStaffSearchValue.value = value;
                        } else {
                          EducationStaffController
                              .educationStaffSearchValue.value = "all";
                        }
                      },
                      delay: 0,
                      label: Text(
                        appLocalizations!.searchField,
                      ),
                      prefix: Icon(
                        Icons.search_rounded,
                      ),
                    ),
                  ),
                  columns: [
                    {
                      ColumnData.name: "educationStaffAcademicNumber",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.academicNumber,
                      ColumnData.canSort: true,
                    },
                    {
                      ColumnData.name: "educationStaffName",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.name,
                      ColumnData.canSort: true,
                    },
                    {
                      ColumnData.name: "educationStaffAcademicDegree",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.academicDegree,
                      ColumnData.canSort: true,
                    },
                    {
                      ColumnData.name: "educationStaffGender",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.gender,
                      ColumnData.canSort: true,
                    },
                    {
                      ColumnData.name: "educationStaffJobTitle",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.jobTitle,
                      ColumnData.canSort: true,
                    },
                    {
                      ColumnData.name: "educationStaffBirthDate",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.birthDate,
                      ColumnData.canSort: true,
                    },
                    {
                      ColumnData.name: "educationStaffPermisions",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.permisions,
                      ColumnData.canSort: false,
                    },
                    {
                      ColumnData.width: 70.toDouble(),
                      ColumnData.text: appLocalizations!.display(''),
                      ColumnData.canSort: false,
                    },
                    {
                      ColumnData.width: 70.toDouble(),
                      ColumnData.text: appLocalizations!.edit,
                      ColumnData.canSort: false,
                    },
                    {
                      ColumnData.width: 70.toDouble(),
                      ColumnData.text: appLocalizations!.delete,
                      ColumnData.canSort: false,
                    },
                  ],
                  rows: snapshot.hasData
                      ? snapshot.data!.docs.map<Map<dynamic, dynamic>>(
                          (document) {
                            return {
                              "id": document.id,
                              "educationStaffAcademicNumber": MyDataCell(
                                text: document['educationStaffAcademicNumber'],
                              ),
                              "educationStaffName": MyDataCell(
                                text: document['educationStaffName'],
                              ),
                              "educationStaffAcademicDegree": MyDataCell(
                                text: EducationStaffController
                                    .getEducationStaffAcademicDegree(
                                  educationStaffAcademicDegree:
                                      document['educationStaffAcademicDegree'],
                                  appLocalizations: appLocalizations!,
                                ),
                              ),
                              "educationStaffGender": MyDataCell(
                                text: EducationStaffController
                                    .getEducationStaffGender(
                                  educationStaffGender:
                                      document['educationStaffGender'],
                                  appLocalizations: appLocalizations!,
                                ),
                              ),
                              "educationStaffJobTitle": MyDataCell(
                                text: EducationStaffController
                                    .getEducationStaffJobTitle(
                                  educationStaffJobTitle:
                                      document['educationStaffJobTitle'],
                                  appLocalizations: appLocalizations!,
                                ),
                              ),
                              "educationStaffBirthDate": MyDataCell(
                                text: document['educationStaffBirthDate']
                                        .isNotEmpty
                                    ? document['educationStaffBirthDate']
                                    : '--------',
                              ),
                              "educationStaffPermisions": MyDataCell(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      document['educationStaffPermisionName'],
                                      style: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: Get.width * 0.035,
                                      ),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(
                                          EdgeInsets.zero,
                                        ),
                                      ),
                                      onPressed: () {
                                        _getPermisionData(
                                          permisionId: document[
                                              'educationStaffPermisions'],
                                          isShow: true,
                                        );
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye_rounded,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              "show": MyDataCell(
                                width: 70,
                                alignment: Alignment.center,
                                child: Obx(
                                  () => MyButton(
                                    isEnable: !EducationStaffController
                                        .isEducationStaffOperationWaiting.value,
                                    onPressed: () {
                                      EducationStaffController
                                          .isEducationStaffOperationType
                                          .value = "show";
                                      EducationStaffController
                                          .isEducationStaffOperationId
                                          .value = document.id;
                                      showEduactionStaff(
                                          educationStaffId: document.id);
                                    },
                                    elevation: 5,
                                    width: Get.width * 0.122,
                                    backgroundColor: Colors.green,
                                    child: EducationStaffController
                                                .isEducationStaffOperationWaiting
                                                .value &&
                                            EducationStaffController
                                                    .isEducationStaffOperationType
                                                    .value ==
                                                "show" &&
                                            EducationStaffController
                                                    .isEducationStaffOperationId
                                                    .value ==
                                                document.id
                                        ? Loading.getCubeGrid(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceTint,
                                          )
                                        : Icon(
                                            Icons.remove_red_eye_rounded,
                                            color:
                                                Get.theme.colorScheme.onSurface,
                                          ),
                                  ),
                                ),
                              ),
                              "edit": MyDataCell(
                                width: 70,
                                alignment: Alignment.center,
                                child: Obx(
                                  () => MyButton(
                                    isEnable: !EducationStaffController
                                        .isEducationStaffOperationWaiting.value,
                                    onPressed: () {
                                      EducationStaffController
                                          .isEducationStaffOperationType
                                          .value = "edit";
                                      EducationStaffController
                                          .isEducationStaffOperationId
                                          .value = document.id;
                                      _getEducationStaffEditData(
                                        educationStaffId: document.id,
                                      );
                                    },
                                    elevation: 5,
                                    width: Get.width * 0.122,
                                    backgroundColor: Colors.blue,
                                    child: EducationStaffController
                                                .isEducationStaffOperationWaiting
                                                .value &&
                                            EducationStaffController
                                                    .isEducationStaffOperationType
                                                    .value ==
                                                "edit" &&
                                            EducationStaffController
                                                    .isEducationStaffOperationId
                                                    .value ==
                                                document.id
                                        ? Loading.getCubeGrid(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceTint,
                                          )
                                        : Icon(
                                            Icons.mode_edit_outline_outlined,
                                            color:
                                                Get.theme.colorScheme.onSurface,
                                          ),
                                  ),
                                ),
                              ),
                              "delete": MyDataCell(
                                width: 70,
                                textColor: Get.theme.colorScheme.onSurface,
                                alignment: Alignment.center,
                                columnsCount: 6,
                                child: Obx(
                                  () => MyButton(
                                    isEnable: !EducationStaffController
                                        .isEducationStaffOperationWaiting.value,
                                    elevation: 5,
                                    backgroundColor:
                                        Get.theme.colorScheme.onError,
                                    width: Get.width * 0.122,
                                    onPressed: () {
                                      EducationStaffController
                                          .isEducationStaffOperationType
                                          .value = "delete";
                                      EducationStaffController
                                          .isEducationStaffOperationId
                                          .value = document.id;
                                      handleDeleteEducationStaff(document);
                                    },
                                    child: EducationStaffController
                                                .isEducationStaffOperationWaiting
                                                .value &&
                                            EducationStaffController
                                                    .isEducationStaffOperationType
                                                    .value ==
                                                "delete" &&
                                            EducationStaffController
                                                    .isEducationStaffOperationId
                                                    .value ==
                                                document.id
                                        ? Loading.getCubeGrid(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surfaceTint,
                                          )
                                        : Icon(
                                            Icons.delete_rounded,
                                            color:
                                                Get.theme.colorScheme.onSurface,
                                          ),
                                  ),
                                ),
                              ),
                            };
                          },
                        ).toList()
                      : [],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
