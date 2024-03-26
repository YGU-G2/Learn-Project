import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/views/my_table/my_data_cell.dart';
import 'package:learn/views/my_table/my_data_column.dart';
import 'package:learn/views/my_table/my_table.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/form/my_date_form_field.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:learn/widgets/my_button.dart';

class NemsSettings extends StatelessWidget {
  const NemsSettings({super.key, required this.appLocalizations});

  final AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    void _newsAddEditDialog() {
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
                    title: appLocalizations.add(
                      appLocalizations.newss,
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
                      Column(
                        children: [
                          FlipInY(
                            delay: Duration(milliseconds: 700),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: Text(
                              appLocalizations.newsImage,
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
                                  backgroundColor:
                                      Get.theme.colorScheme.background,
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
                        ],
                      ),
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations.newsNumber,
                        isRequired: true,
                        keyboardType: TextInputType.number,
                        label: Text(
                          appLocalizations.enter(
                            appLocalizations.the(
                              appLocalizations.newsNumber,
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
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations.newsTitle,
                        isRequired: true,
                        keyboardType: TextInputType.name,
                        label: Text(
                          appLocalizations.enter(
                            appLocalizations.the(
                              appLocalizations.newsTitle,
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
                      MyTextFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations.newsText,
                        isRequired: true,
                        label: Text(
                          appLocalizations.enter(
                            appLocalizations.the(
                              appLocalizations.newsText,
                            ),
                          ),
                        ),
                        prefix: Icon(
                          FontAwesome.building_wheat_solid,
                        ),
                        maxLines: 5,
                        maxLength: 300,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyDateFormField(
                        name: "",
                        fillColor: Theme.of(context).colorScheme.background,
                        title: appLocalizations.newsDate,
                        isRequired: true,
                        keyboardType: TextInputType.name,
                        label: Text(
                          appLocalizations.enter(
                            appLocalizations.the(
                              appLocalizations.newsDate,
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
            title: appLocalizations.news,
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
                    _newsAddEditDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        appLocalizations.addNew,
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
            FadeIn(
              child: MyTable(
                enableSelectedColumn: true,
                hasData: false,
                isWaiting: false,
                showHeader: true,
                header: Center(
                  child: Text(
                    appLocalizations.all(appLocalizations.news),
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: Get.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                columns: [
                  {
                    ColumnData.name: "newsNumber",
                    ColumnData.text: appLocalizations.newsNumber,
                    ColumnData.width: 200,
                    ColumnData.canSort: true,
                  },
                  {
                    ColumnData.name: "newsImage",
                    ColumnData.text: appLocalizations.newsImage,
                    ColumnData.width: 250,
                    ColumnData.canSort: true,
                  },
                  {
                    ColumnData.name: "newsTitle",
                    ColumnData.text: appLocalizations.newsTitle,
                    ColumnData.width: 200,
                    ColumnData.canSort: true,
                  },
                  {
                    ColumnData.name: "newsText",
                    ColumnData.text: appLocalizations.newsText,
                    ColumnData.width: 400,
                    ColumnData.canSort: true,
                  },
                  {
                    ColumnData.name: "newsDate",
                    ColumnData.text: appLocalizations.newsDate,
                    ColumnData.width: 200,
                    ColumnData.canSort: true,
                  },
                  {
                    ColumnData.name: "newsEdit",
                    ColumnData.text: appLocalizations!.edit,
                    ColumnData.width: 70,
                    ColumnData.canSort: false,
                  },
                  {
                    ColumnData.name: "newsDelete",
                    ColumnData.text: appLocalizations!.delete,
                    ColumnData.width: 70,
                    ColumnData.canSort: false,
                  },
                ],
                rows: List.generate(100, (index) {
                  return {
                    "id": "${Random().nextInt(1000).toString()}",
                    "newsNumber": MyDataCell(
                      width: 200,
                      text: Random().nextInt(1000).toString(),
                    ),
                    "newsImage": MyDataCell(
                      width: 250,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 200,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    "newsTitle": MyDataCell(
                      width: 200,
                      text: "news ${Random().nextInt(1000)}",
                    ),
                    "newsText": MyDataCell(
                      width: 400,
                      isLongText: true,
                      text:
                          "(optional) Widget keychild	            Widget	    Child Widget to animate duration	        Duration	Animation duration delay	            Duration	Delay before the animation from	            double	    Initial or final destination, if you want a slide or fade more striking animate	            boolean	    Change this property from false to true to start the animation (useful if you use setState, Bloc, Provider, Redux or any other state management system) infinite	        boolean	    Attention seekers can be run infinitely with this property spins	            double	    The number of spins that you want (some animations have this, ex: Spin, Roulette, PerfectSpin ) manualTrigger	    boolean	    if you're going to trigger the animation manually (required the controller property) controller	        Function	Function that exposes the controller (advanced use cases the majority don't need this) onFinish	        Function	Function that is called when the animation finished (With argument: forward or backward ) curve	            Curve	    You can change the curve animation of any Animated widget in order to customize it",
                    ),
                    "newsDate": MyDataCell(
                      width: 200,
                      text: "news ${Random().nextInt(1000)}",
                    ),
                    "newsEdit": MyDataCell(
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
                    "newsDelete": MyDataCell(
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
        )
      ],
    );
  }
}
