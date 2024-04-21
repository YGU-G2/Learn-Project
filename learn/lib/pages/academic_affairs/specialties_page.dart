import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_table/my_data_cell.dart';
import 'package:learn/views/my_table/my_data_column.dart';
import 'package:learn/views/my_table/my_table.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:learn/widgets/my_button.dart';

class SpecialtiesPage extends StatelessWidget {
  const SpecialtiesPage({
    super.key,
    this.appLocalizations,
  });

  final AppLocalizations? appLocalizations;

  @override
  Widget build(BuildContext context) {

    void _specialtiesAddEditDialog() {
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
                    right: 8,
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
                  BodyTitle(
                    title: appLocalizations!.add(
                      appLocalizations!.specialty,
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
                  child: ListView(
                    children: [
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations!.specializationNumber,
                        isRequired: true,
                        keyboardType: TextInputType.number,
                        label: Text(
                          appLocalizations!.enter(
                            appLocalizations!.the(
                              appLocalizations!.specializationNumber,
                            ),
                          ),
                        ),
                        prefix: Icon(
                          Icons.account_tree_rounded,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations!.specializationName,
                        isRequired: true,
                        keyboardType: TextInputType.name,
                        label: Text(
                          appLocalizations!.enter(
                            appLocalizations!.the(
                              appLocalizations!.specializationName,
                            ),
                          ),
                        ),
                        prefix: Icon(
                          Icons.account_tree_rounded,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations!.numberOfYears,
                        isRequired: true,
                        label: Text(
                          appLocalizations!.enter(
                            appLocalizations!.the(
                              appLocalizations!.numberOfYears,
                            ),
                          ),
                        ),
                        prefix: Icon(
                          Icons.account_tree_rounded,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations!.collegeName,
                        isRequired: true,
                        label: Text(
                          appLocalizations!.enter(
                            appLocalizations!.the(
                              appLocalizations!.collegeName,
                            ),
                          ),
                        ),
                        prefix: Icon(
                          FontAwesome.building_wheat_solid,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlipInY(
                        delay: Duration(milliseconds: 1100),
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 500),
                        child: MyButton(
                          // isEnable: !AcademicAffairsController
                          //     .addEducationStaffIsLoading.value,
                          // onPressed: () =>
                          //     educationStaffFormKey.currentState!.reset(),
                          elevation: 5,
                          child: Text(
                            appLocalizations!.add(""),
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: Get.width * 0.040,
                              fontWeight: FontWeight.bold,
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
                        child: MyButton(
                          // isEnable: !AcademicAffairsController
                          //     .addEducationStaffIsLoading.value,
                          // onPressed: () =>
                          //     educationStaffFormKey.currentState!.reset(),
                          elevation: 5,
                          child: Text(
                            appLocalizations!.emptying,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: Get.width * 0.040,
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
              ),
            ),
          );
        },
      );
    }

    return ListView(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: BodyTitle(
            title: appLocalizations!.specialties,
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
                  onPressed: () {
                    _specialtiesAddEditDialog();
                  },
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
                        Icons.add,
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
          child: MyTable(
            enableSelectedColumn: true,
            hasData: false,
            isWaiting: false,
            showHeader: true,
            header: Center(
              child: Text(
                appLocalizations!.all(
                  appLocalizations!.specialties,
                ),
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: Get.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            columns: [
              {
                ColumnData.name: "collegeNumber",
                ColumnData.text: appLocalizations!.specializationNumber,
                ColumnData.width: 200,
                ColumnData.canSort: true,
              },
              {
                ColumnData.name: "collegeImage",
                ColumnData.text: appLocalizations!.specializationName,
                ColumnData.width: 250,
                ColumnData.canSort: true,
              },
              {
                ColumnData.name: "collegeName",
                ColumnData.text: appLocalizations!.numberOfYears,
                ColumnData.width: 200,
                ColumnData.canSort: true,
              },
              {
                ColumnData.name: "collegeDescription",
                ColumnData.text: appLocalizations!.collegeName,
                ColumnData.width: 200,
                ColumnData.canSort: true,
              },
              {
                ColumnData.name: "collegeEdit",
                ColumnData.text: appLocalizations!.edit,
                ColumnData.width: 70,
                ColumnData.canSort: false,
              },
              {
                ColumnData.name: "collegeDelete",
                ColumnData.text: appLocalizations!.delete,
                ColumnData.width: 70,
                ColumnData.canSort: false,
              },
            ],
            rows: List.generate(100, (index) {
              return {
                "id": "${Random().nextInt(1000).toString()}",
                "collegeNumber": MyDataCell(
                  width: 200,
                  text: Random().nextInt(1000).toString(),
                ),
                "collegeImage": MyDataCell(
                  width: 250,
                  text: Random().nextInt(1000).toString(),
                ),
                "collegeName": MyDataCell(
                  width: 200,
                  text: "college ${Random().nextInt(1000)}",
                ),
                "collegeDescription": MyDataCell(
                  width: 200,
                  text: Random().nextInt(1000).toString(),
                ),
                "collegeEdit": MyDataCell(
                  width: 70,
                  alignment: Alignment.center,
                  child: MyButton(
                    elevation: 5,
                    width: Get.width * 0.122,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.mode_edit_outline_outlined,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                "collegeDelete": MyDataCell(
                  width: 70,
                  textColor: Get.theme.colorScheme.onSurface,
                  alignment: Alignment.center,
                  columnsCount: 6,
                  child: MyButton(
                    elevation: 5,
                    backgroundColor: Get.theme.colorScheme.onError,
                    width: Get.width * 0.122,
                    child: Icon(
                      Icons.delete_rounded,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              };
            }),
            index: 1,
            appLocalizations: appLocalizations!,
          ),
        ),
      ],
    );
  }
}
