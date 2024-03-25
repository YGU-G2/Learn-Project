import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:learn/controller/academic_affairs/academic_affairs_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/models/education_staff.dart';
import 'package:learn/views/my_table/my_data_cell.dart';
import 'package:learn/views/my_table/my_data_column.dart';
import 'package:learn/views/my_table/my_table.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/form/my_date_form_field.dart';
import 'package:learn/widgets/form/my_select_from_field.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:learn/widgets/loading.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationStaffPage extends StatelessWidget {
  const EducationStaffPage({
    super.key,
    required this.appLocalizations,
  });

  final AppLocalizations? appLocalizations;

  @override
  Widget build(BuildContext context) {
    final educationStaffFormKey = GlobalKey<FormBuilderState>();
    final searchFormKey = GlobalKey<FormBuilderState>();
    final TableController tableController = Get.find<TableController>();

    void _handleAddEducationStaff() async {
      if (educationStaffFormKey.currentState!.saveAndValidate()) {
        await AcademicAffairsController.addEducationStaff(
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
          ),
        );
      }
    }

    void _handleEditEducationStaff(EducationStaff editEducationStaff) async {
      if (educationStaffFormKey.currentState!.saveAndValidate()) {
        await AcademicAffairsController.editEducationStaff(
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
          ),
        );
      }
    }

    void _handleDeleteEducationStaff(
        QueryDocumentSnapshot<Map<String, dynamic>> document) {
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
              title: Padding(
                padding: EdgeInsets.all(
                  Get.width * 0.037,
                ),
                child: Text(
                  appLocalizations!.verificationMessage,
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: Get.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: Get.width * 0.05,
                    left: Get.width * 0.05,
                    bottom: Get.width * 0.05,
                  ),
                  child: Text(
                    appLocalizations!.deleteSure(
                      document['educationStaffName'],
                    ),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Get.width * 0.040,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(
                    Get.width * 0.025,
                  ), // 10
                  child: TextButton(
                    onPressed: () {
                      AcademicAffairsController.educationStaffWaitingBtn.value =
                          document.id;
                      AcademicAffairsController.deleteEducationStaff(
                        educationStaffId: document.id,
                      );
                      Get.back();
                    },
                    child: Text(
                      appLocalizations!.yes,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(
                    Get.width * 0.025,
                  ), // 10
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      appLocalizations!.no,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void _onFieldsChanges(String name) {
      educationStaffFormKey.currentState!.fields[name]!.validate(
        focusOnInvalid: false,
      );
    }

    bool _isDataEdit({required EducationStaff educationStaff}) {
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

    Future<void> _educationStaffAddEditDialog({
      required bool isAdd,
      EducationStaff? educationStaff,
    }) async {
      AcademicAffairsController.isEducationStaffEditBtnEnable.value = false;
      if (isAdd) {
        AcademicAffairsController.isEducationStaffEditBtnEnable.value = true;
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
                    child: ListView(
                      children: [
                        MyTextFormField(
                          name: "educationStaffName",
                          delay: 600,
                          initialValue:
                              isAdd ? null : educationStaff!.educationStaffName,
                          onChanged: (value) {
                            if (!isAdd) {
                              AcademicAffairsController
                                      .isEducationStaffEditBtnEnable.value =
                                  _isDataEdit(educationStaff: educationStaff!);
                            }
                            _onFieldsChanges(
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
                          name: "educationStaffAcademicNumber",
                          delay: 700,
                          initialValue: isAdd
                              ? null
                              : educationStaff!.educationStaffAcademicNumber,
                          onChanged: (value) {
                            if (!isAdd) {
                              AcademicAffairsController
                                      .isEducationStaffEditBtnEnable.value =
                                  _isDataEdit(educationStaff: educationStaff!);
                            }
                            _onFieldsChanges(
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
                          name: "educationStaffAcademicDegree",
                          delay: 800,
                          initialValue: isAdd
                              ? null
                              : educationStaff!.educationStaffAcademicDegree,
                          onChanged: (value) {
                            if (!isAdd) {
                              AcademicAffairsController
                                      .isEducationStaffEditBtnEnable.value =
                                  _isDataEdit(educationStaff: educationStaff!);
                            }
                            _onFieldsChanges(
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
                            appLocalizations!.professor,
                            appLocalizations!.doctorate,
                            appLocalizations!.bachelor,
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
                          name: "educationStaffGender",
                          delay: 900,
                          initialValue: isAdd
                              ? null
                              : educationStaff!.educationStaffGender,
                          onChanged: (value) {
                            if (!isAdd) {
                              AcademicAffairsController
                                      .isEducationStaffEditBtnEnable.value =
                                  _isDataEdit(educationStaff: educationStaff!);
                            }
                            _onFieldsChanges(
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
                            appLocalizations!.male,
                            appLocalizations!.female,
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
                          name: "educationStaffBirthDate",
                          delay: 1000,
                          onChanged: (value) {
                            if (!isAdd) {
                              AcademicAffairsController
                                      .isEducationStaffEditBtnEnable.value =
                                  _isDataEdit(educationStaff: educationStaff!);
                            }
                          },
                          initialValue: isAdd
                              ? null
                              : educationStaff!.educationStaffBirthDate,
                          title: appLocalizations!.birthDate,
                          keyboardType: TextInputType.number,
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
                        FlipInY(
                          delay: Duration(milliseconds: 1100),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: Obx(
                            () => MyButton(
                              isEnable: AcademicAffairsController
                                      .isEducationStaffEditBtnEnable.value
                                  ? !AcademicAffairsController
                                      .isAddEditEndEducationStaffIsLoading.value
                                  : false,
                              onPressed: () {
                                if (isAdd) {
                                  _handleAddEducationStaff();
                                } else {
                                  _handleEditEducationStaff(
                                    educationStaff!,
                                  );
                                }
                              },
                              elevation: 5,
                              child: AcademicAffairsController
                                      .isAddEditEndEducationStaffIsLoading.value
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
                              isEnable: !AcademicAffairsController
                                  .isAddEditEndEducationStaffIsLoading.value,
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
          );
        },
      );
    }

    Future<void> _getEditData({required String educationStaffId}) async {
      AcademicAffairsController.isEducationStaffEditWaiting.value = true;
      EducationStaff educationStaff =
          await AcademicAffairsController.getEducationStaffById(
        educationStaffId,
      );
      _educationStaffAddEditDialog(
        isAdd: false,
        educationStaff: educationStaff,
      );
      AcademicAffairsController.isEducationStaffEditWaiting.value = false;
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
              stream: AcademicAffairsController.getEducationStaffData(
                AcademicAffairsController.educationStaffSearchValue,
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection:
                                LanguageController.getCurrentLanguage() == "ar"
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
                              title: Padding(
                                padding: EdgeInsets.only(
                                  top: Get.width * 0.037,
                                  right: Get.width * 0.037,
                                  left: Get.width * 0.037,
                                ),
                                child: Text(
                                  appLocalizations!.verificationMessage,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: Get.width * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              content: SizedBox(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: Get.width * 0.05,
                                    left: Get.width * 0.05,
                                    bottom: Get.width * 0.05,
                                  ),
                                  child: Text(
                                    appLocalizations!.deleteSure(
                                      "${tableController.getSelectedCount(1)} ${appLocalizations!.ofRows}",
                                    ),
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      fontSize: Get.width * 0.040,
                                    ),
                                  ),
                                ),
                              ),
                              actions: [
                                Padding(
                                  padding: EdgeInsets.all(
                                    Get.width * 0.025,
                                  ), // 10
                                  child: TextButton(
                                    onPressed: () {
                                      List<String> educationStaffIds = [];
                                      for (var i = 0;
                                          i < tableController.getRowsLength(1);
                                          i++) {
                                        if (tableController.getRow(1)[i]
                                            ['isSelected']) {
                                          educationStaffIds.add(
                                            tableController.getRow(1)[i]['id'],
                                          );
                                        }
                                      }
                                      AcademicAffairsController
                                          .deleteAllEducationStaff(
                                        educationStaffIds: educationStaffIds,
                                      );
                                      Get.back();
                                    },
                                    child: Text(
                                      appLocalizations!.yes,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    Get.width * 0.025,
                                  ), // 10
                                  child: TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: Text(
                                      appLocalizations!.no,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                          AcademicAffairsController
                              .educationStaffSearchValue.value = value;
                        } else {
                          AcademicAffairsController
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
                      ColumnData.name: "educationStaffBirthDate",
                      ColumnData.width: 200.toDouble(),
                      ColumnData.text: appLocalizations!.birthDate,
                      ColumnData.canSort: true,
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
                                text: document['educationStaffAcademicDegree'],
                              ),
                              "educationStaffGender": MyDataCell(
                                text: document['educationStaffGender'],
                              ),
                              "educationStaffBirthDate": MyDataCell(
                                text: document['educationStaffBirthDate']
                                        .isNotEmpty
                                    ? document['educationStaffBirthDate']
                                    : '--------',
                              ),
                              "${document.id}": MyDataCell(
                                width: 70,
                                alignment: Alignment.center,
                                child: Obx(
                                  () => MyButton(
                                    isEnable: !AcademicAffairsController
                                        .isEducationStaffEditWaiting.value,
                                    onPressed: () {
                                      AcademicAffairsController
                                          .educationStaffWaitingBtn
                                          .value = document.id;
                                      _getEditData(
                                        educationStaffId: document.id,
                                      );
                                    },
                                    elevation: 5,
                                    width: Get.width * 0.122,
                                    backgroundColor: Colors.blue,
                                    child: AcademicAffairsController
                                                .educationStaffWaitingBtn
                                                .value ==
                                            document.id
                                        ? AcademicAffairsController
                                                .isEducationStaffEditWaiting
                                                .value
                                            ? Loading.getCubeGrid()
                                            : Icon(
                                                Icons
                                                    .mode_edit_outline_outlined,
                                                color: Get.theme.colorScheme
                                                    .onSurface,
                                              )
                                        : Icon(
                                            Icons.mode_edit_outline_outlined,
                                            color:
                                                Get.theme.colorScheme.onSurface,
                                          ),
                                  ),
                                ),
                              ),
                              "${document.id};": MyDataCell(
                                width: 70,
                                textColor: Get.theme.colorScheme.onSurface,
                                alignment: Alignment.center,
                                columnsCount: 6,
                                child: Obx(
                                  () => MyButton(
                                    isEnable: !AcademicAffairsController
                                        .isEducationStaffDeleteWaiting.value,
                                    elevation: 5,
                                    backgroundColor:
                                        Get.theme.colorScheme.onError,
                                    width: Get.width * 0.122,
                                    onPressed: () {
                                      _handleDeleteEducationStaff(document);
                                    },
                                    child: AcademicAffairsController
                                                .educationStaffWaitingBtn
                                                .value ==
                                            document.id
                                        ? AcademicAffairsController
                                                .isEducationStaffDeleteWaiting
                                                .value
                                            ? Loading.getCubeGrid()
                                            : Icon(
                                                Icons.delete_rounded,
                                                color: Get.theme.colorScheme
                                                    .onSurface,
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
