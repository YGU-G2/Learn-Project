import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/views/my_table/my_data_cell.dart';
import 'package:learn/views/my_table/my_data_column.dart';
import 'package:learn/views/my_table/my_table.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/form/my_text_form_field.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CollagesSetting extends StatelessWidget {
  const CollagesSetting({
    super.key,
    required this.appLocalizations,
  });

  final AppLocalizations? appLocalizations;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: BodyTitle(
            title: appLocalizations!.colleges,
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection: TextDirection.ltr,
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
                                  BodyTitle(title: "اضافة كلية"),
                                ],
                              ),
                              content: SizedBox(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: Get.width * 0.05,
                                      left: Get.width * 0.05,
                                      bottom: Get.width * 0.05),
                                  child: ListView(
                                    children: [
                                      MyTextFormField(
                                        name: "",
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        title: "اسم الكلية",
                                        isRequired: true,
                                        keyboardType: TextInputType.name,
                                        label: Text("ادخل اسم الكلية"),
                                        prefix: Icon(Icons.location_city_rounded),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      MyTextFormField(
                                        name: "",
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        title: "وصف الكلية",
                                        isRequired: true,
                                        label: Text("ادخل وصف الكلية"),
                                        prefix: Icon(Icons.location_city_rounded),
                                        maxLines: 5,
                                        maxLength: 300,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
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
        // FadeIn(
        //   delay: Duration(milliseconds: 900),
        //   curve: Curves.fastOutSlowIn,
        //   duration: Duration(milliseconds: 500),
        //   child: MyTable(
        //     animatedDelay: 1300,
        //     appLocalizations: appLocalizations!,
        //     index: 0,
        //     isPaginatedData: true,
        //     rowPerPagesNumber: 10,
        //     header: Center(
        //       child: Text(
        //         appLocalizations!.all(appLocalizations!.colleges),
        //         style: TextStyle(
        //           color: Get.theme.primaryColorLight,
        //           fontSize: Get.width * 0.05,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //     ),
        //     enableSelectedColumn: true,
        //     canSortByColumns: true,
        //     showHeader: true,
        //     columns: [
        //       MyDataColumn(
        //         text: "Collage Number",
        //         columnsCount: 4,
        //       ),
        //       MyDataColumn(
        //         text: "Collage Image",
        //         columnsCount: 4,
        //       ),
        //       MyDataColumn(
        //         text: "Collage Name",
        //         columnsCount: 4,
        //       ),
        //       MyDataColumn(
        //         text: "Collage Describshen",
        //         columnsCount: 4,
        //         width: 400,
        //       ),
        //       MyDataColumn(
        //         width: 70,
        //         text: "Edit",
        //         columnsCount: 4,
        //       ),
        //       MyDataColumn(
        //         width: 70,
        //         text: "Delete",
        //         columnsCount: 4,
        //       ),
        //     ],
        //     rows: List.generate(
        //       100,
        //       (index) => {
        //         "Collage Number": MyDataCell(
        //           columnsCount: 6,
        //           text: index.toString(),
        //         ),
        //         "Collage Image": MyDataCell(
        //           columnsCount: 6,
        //           text: "data $index",
        //         ),
        //         "Collage Name": MyDataCell(
        //           columnsCount: 6,
        //           text: "data $index",
        //         ),
        //         "Collage Describshen": MyDataCell(
        //           alignment: Alignment.center,
        //           isLongText: true,
        //           width: 400,
        //           columnsCount: 6,
        //           text:
        //               "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
        //         ),
        //         "Edit": MyDataCell(
        //           width: 70,
        //           alignment: Alignment.center,
        //           columnsCount: 6,
        //           child: MyButton(
        //             elevation: 5,
        //             width: Get.width * 0.122,
        //             backgroundColor: Colors.blue,
        //             child: Icon(
        //               Icons.mode_edit_outline_outlined,
        //               color: Get.theme.colorScheme.onSurface,
        //             ),
        //           ),
        //         ),
        //         "Delete": MyDataCell(
        //           width: 70,
        //           textColor: Get.theme.colorScheme.onSurface,
        //           alignment: Alignment.center,
        //           columnsCount: 6,
        //           child: MyButton(
        //             elevation: 5,
        //             backgroundColor: Get.theme.colorScheme.onError,
        //             width: Get.width * 0.122,
        //             child: Icon(
        //               Icons.delete_rounded,
        //               color: Get.theme.colorScheme.onSurface,
        //             ),
        //           ),
        //         ),
        //       },
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
