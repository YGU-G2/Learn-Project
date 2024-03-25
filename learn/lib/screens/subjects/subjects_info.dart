import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_bottom_sheet/drag_zone_position.dart';
import 'package:just_bottom_sheet/just_bottom_sheet.dart';
import 'package:just_bottom_sheet/just_bottom_sheet_configuration.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/screens/subjects/main_subjects_screen.dart';
import 'package:learn/screens/subjects/subjects_media_links_docs.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/grades_card.dart';
import 'package:learn/widgets/lectuers_grades_tile.dart';

class SubjectsInfo extends StatelessWidget {
  const SubjectsInfo({super.key});

  static String id = "/subjects_info";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      appLocalizations: appLocalizations!,
      useAppBar: true,
      hasBack: true,
      body: ListView(
        children: [
          FadeInRight(
            delay: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: "JavaScript",
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          BounceInDown(
            delay: Duration(milliseconds: 700),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? ",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 900),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: appLocalizations.subjectTeacher,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 1100),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              child: ListTile(
                title: Text(
                  "Dr. Ebrahim Alharby",
                  style: TextStyle(
                    color: Get.theme.primaryColorLight,
                    fontSize: Get.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "JavaScript Teacher",
                  style: TextStyle(
                    color: Get.theme.colorScheme.onPrimary,
                    fontSize: Get.width * 0.037,
                  ),
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/1.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: Icon(
                  LanguageController.getCurrentLanguage() == "ar"
                      ? Icons.arrow_back_ios_new_rounded
                      : Icons.arrow_forward_ios_rounded,
                  color: Get.theme.colorScheme.onPrimary,
                  size: Get.width * 0.045,
                ),
              ),
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 1300),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: appLocalizations.mediaLinksDocuments,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 1500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: ListTile(
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.0125,
                      ), // 5
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/1.jpg",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              trailing: TextButton(
                onPressed: () => Get.toNamed(
                  "${MainSubjectsScreen.id}/${SubjectsInfo.id}/${SubjectsMediaLinksDocs.id}",
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                child: SizedBox(
                  width: 40,
                  height: 150,
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      LanguageController.getCurrentLanguage() == "ar"
                      ? Icons.arrow_back_ios_new_rounded
                      : Icons.arrow_forward_ios_rounded,
                      color: Get.theme.colorScheme.onPrimary,
                      size: Get.width * 0.045,
                    ),
                  ),
                ),
              ),
            ),
          ),
          FadeInRight(
            delay: Duration(milliseconds: 1700),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: appLocalizations.subjectGrades,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          Wrap(
            children: [
              ZoomIn(
                delay: Duration(milliseconds: 1900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: GradesCard(
                  appLocalizations: appLocalizations,
                  title: "الحضور",
                  progressLabel: "درجات الحضور",
                  totalGrades: 10,
                  percentage: 7,
                  width: (Get.width / 2) - Get.width * 0.073,
                  delay: 1500,
                  onPressed: () {
                    showJustBottomSheet(
                      context: context,
                      dragZoneConfiguration:
                          JustBottomSheetDragZoneConfiguration(
                        dragZonePosition: DragZonePosition.inside,
                        backgroundColor: Get.theme.primaryColorDark,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 5,
                            width: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      configuration: JustBottomSheetPageConfiguration(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        height: Get.height / 1.5,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).primaryColorDark,
                            child: Column(
                              children: [
                                FadeInDown(
                                  delay: Duration(
                                    milliseconds: 0,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: BodyTitle(
                                    title: "درجات الحضور",
                                    fontSize: Get.width * 0.045,
                                    lineThickness: 1.5,
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    children: [
                                      LectuersGradesTile(
                                        title: "Lectuers 1",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 500,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 2",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 700,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 3",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 900,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 4",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1100,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 5",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1300,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 6",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1500,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 7",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1700,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 8",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1900,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 9",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 2100,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 10",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 2300,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.05),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "الحضور",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 1700,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "7",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1900,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "الغياب",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 2100,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "3",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 2300,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "مجموع الدرجات",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 2500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "7 / 10",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        scrollController: ScrollController(),
                        closeOnScroll: false,
                        cornerRadius: 10,
                      ),
                    );
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1700),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: GradesCard(
                  appLocalizations: appLocalizations,
                  title: "الاختبارات",
                  progressLabel: "درجات الاختبارات",
                  totalGrades: 60,
                  percentage: 48,
                  width: (Get.width / 2) - Get.width * 0.073,
                  delay: 1700,
                  onPressed: () {
                    showJustBottomSheet(
                      context: context,
                      dragZoneConfiguration:
                          JustBottomSheetDragZoneConfiguration(
                        dragZonePosition: DragZonePosition.inside,
                        backgroundColor: Get.theme.primaryColorDark,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 5,
                            width: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      configuration: JustBottomSheetPageConfiguration(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        height: Get.height / 1.5,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).primaryColorDark,
                            child: Column(
                              children: [
                                FadeInDown(
                                  delay: Duration(
                                    milliseconds: 0,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: BodyTitle(
                                    title: "درجات الاختبارات",
                                    fontSize: Get.width * 0.045,
                                    lineThickness: 1.5,
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    children: [
                                      LectuersGradesTile(
                                        title: "Lectuers 1",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 500,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 2",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 700,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 3",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 900,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 4",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1100,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 5",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1300,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 6",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1500,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 7",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1700,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 8",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1900,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 9",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 2100,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 10",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 2300,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.05),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "الحضور",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 1700,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "7",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1900,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "الغياب",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 2100,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "3",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 2300,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "مجموع الدرجات",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 2500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "7 / 10",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        scrollController: ScrollController(),
                        closeOnScroll: false,
                        cornerRadius: 10,
                      ),
                    );
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 1900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: GradesCard(
                  appLocalizations: appLocalizations,
                  title: "التكاليف",
                  progressLabel: "درجات التكاليف",
                  totalGrades: 20,
                  percentage: 8,
                  width: (Get.width / 2) - Get.width * 0.073,
                  delay: 1900,
                  onPressed: () {
                    showJustBottomSheet(
                      context: context,
                      dragZoneConfiguration:
                          JustBottomSheetDragZoneConfiguration(
                        dragZonePosition: DragZonePosition.inside,
                        backgroundColor: Get.theme.primaryColorDark,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 5,
                            width: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      configuration: JustBottomSheetPageConfiguration(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        height: Get.height / 1.5,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).primaryColorDark,
                            child: Column(
                              children: [
                                FadeInDown(
                                  delay: Duration(
                                    milliseconds: 0,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: BodyTitle(
                                    title: "درجات التكاليف",
                                    fontSize: Get.width * 0.045,
                                    lineThickness: 1.5,
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    children: [
                                      LectuersGradesTile(
                                        title: "Lectuers 1",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 500,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 2",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 700,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 3",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 900,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 4",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1100,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 5",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1300,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 6",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1500,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 7",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1700,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 8",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 1900,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 9",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 0,
                                        isCheck: false,
                                        delay: 2100,
                                      ),
                                      LectuersGradesTile(
                                        title: "Lectuers 10",
                                        subjectName: "JavaScript",
                                        teacherName: "Dr. Ebrahim Alharby",
                                        grades: 2,
                                        isCheck: true,
                                        delay: 2300,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.05),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "الحضور",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 1700,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "7",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1900,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "الغياب",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 2100,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "3",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 2300,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "مجموع الدرجات",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 2500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "7 / 10",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        scrollController: ScrollController(),
                        closeOnScroll: false,
                        cornerRadius: 10,
                      ),
                    );
                  },
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 2100),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: GradesCard(
                  appLocalizations: appLocalizations,
                  title: "المشاركة",
                  progressLabel: "درجات المشاركة",
                  totalGrades: 10,
                  percentage: 10,
                  width: (Get.width / 2) - Get.width * 0.073,
                  delay: 2100,
                ),
              ),
              ZoomIn(
                delay: Duration(milliseconds: 2300),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: GradesCard(
                  appLocalizations: appLocalizations,
                  title: "إجمالي الدرجات",
                  progressLabel: "الإجمالي",
                  totalGrades: 100,
                  percentage: 73,
                  delay: 2300,
                  onPressed: () {
                    showJustBottomSheet(
                      context: context,
                      dragZoneConfiguration:
                          JustBottomSheetDragZoneConfiguration(
                        dragZonePosition: DragZonePosition.inside,
                        backgroundColor: Get.theme.primaryColorDark,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 5,
                            width: 30,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      configuration: JustBottomSheetPageConfiguration(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        height: Get.height / 1.5,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            color: Theme.of(context).primaryColorDark,
                            child: Column(
                              children: [
                                FadeInDown(
                                  delay: Duration(
                                    milliseconds: 0,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: BodyTitle(
                                    title: "إجمالي الدرجات",
                                    fontSize: Get.width * 0.045,
                                    lineThickness: 1.5,
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    physics: ClampingScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    children: [
                                      FadeInRight(
                                        delay: Duration(
                                          milliseconds: 500,
                                        ),
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(milliseconds: 500),
                                        child: Material(
                                          color: Get.theme.primaryColorDark,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.library_add_check_rounded,
                                              color:
                                                  Get.theme.colorScheme.primary,
                                              size: Get.width * 0.073,
                                            ),
                                            title: Text(
                                              "الحضور",
                                              style: TextStyle(
                                                color:
                                                    Get.theme.primaryColorLight,
                                                fontSize: Get.width * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // subtitle: Text(
                                            //   "10 / 7",
                                            //   style: TextStyle(
                                            //     color: Theme.of(context)
                                            //         .colorScheme
                                            //         .onPrimary,
                                            //     fontSize: Get.width * 0.035,
                                            //   ),
                                            // ),
                                            trailing: Text(
                                              "10 / 7",
                                              style: TextStyle(
                                                color: Get
                                                    .theme.colorScheme.primary,
                                                fontSize: Get.width * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FadeInRight(
                                        delay: Duration(
                                          milliseconds: 700,
                                        ),
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(milliseconds: 500),
                                        child: Material(
                                          color: Get.theme.primaryColorDark,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.fact_check_rounded,
                                              color:
                                                  Get.theme.colorScheme.primary,
                                              size: Get.width * 0.073,
                                            ),
                                            title: Text(
                                              "الاختبارات",
                                              style: TextStyle(
                                                color:
                                                    Get.theme.primaryColorLight,
                                                fontSize: Get.width * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // subtitle: Text(
                                            //   "10 / 7",
                                            //   style: TextStyle(
                                            //     color: Theme.of(context)
                                            //         .colorScheme
                                            //         .onPrimary,
                                            //     fontSize: Get.width * 0.035,
                                            //   ),
                                            // ),
                                            trailing: Text(
                                              "60 / 48",
                                              style: TextStyle(
                                                color: Get
                                                    .theme.colorScheme.primary,
                                                fontSize: Get.width * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      FadeInRight(
                                        delay: Duration(
                                          milliseconds: 900,
                                        ),
                                        curve: Curves.fastOutSlowIn,
                                        duration: Duration(milliseconds: 500),
                                        child: Material(
                                          color: Get.theme.primaryColorDark,
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.playlist_add_check_rounded,
                                              color:
                                                  Get.theme.colorScheme.primary,
                                              size: Get.width * 0.073,
                                            ),
                                            title: Text(
                                              "التكاليف",
                                              style: TextStyle(
                                                color:
                                                    Get.theme.primaryColorLight,
                                                fontSize: Get.width * 0.045,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // subtitle: Text(
                                            //   "10 / 7",
                                            //   style: TextStyle(
                                            //     color: Theme.of(context)
                                            //         .colorScheme
                                            //         .onPrimary,
                                            //     fontSize: Get.width * 0.035,
                                            //   ),
                                            // ),
                                            trailing: Text(
                                              "20 / 8",
                                              style: TextStyle(
                                                color: Get
                                                    .theme.colorScheme.primary,
                                                fontSize: Get.width * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Get.width * 0.05),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                FlipInY(
                                                  delay: Duration(
                                                    milliseconds: 1500,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "النسبة المئوية",
                                                    style: TextStyle(
                                                        color: Get.theme
                                                            .primaryColorLight,
                                                        fontSize:
                                                            Get.width * 0.040,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                                FadeInDown(
                                                  delay: Duration(
                                                    milliseconds: 1700,
                                                  ),
                                                  curve: Curves.fastOutSlowIn,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  child: Text(
                                                    "73%",
                                                    style: TextStyle(
                                                        color: Get
                                                            .theme
                                                            .colorScheme
                                                            .primary,
                                                        fontSize:
                                                            Get.width * 0.035,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        scrollController: ScrollController(),
                        closeOnScroll: false,
                        cornerRadius: 10,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          FadeInRight(
            delay: Duration(milliseconds: 2500),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: BodyTitle(
              title: appLocalizations.bestStudents,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
          TextButton(
            onPressed: () {
              showJustBottomSheet(
                context: context,
                dragZoneConfiguration: JustBottomSheetDragZoneConfiguration(
                  dragZonePosition: DragZonePosition.inside,
                  backgroundColor: Get.theme.primaryColorDark,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 5,
                      width: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                configuration: JustBottomSheetPageConfiguration(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  height: Get.height / 1.5,
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      color: Theme.of(context).primaryColorDark,
                      child: Column(
                        children: [
                          FadeInDown(
                            delay: Duration(
                              milliseconds: 0,
                            ),
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 500),
                            child: BodyTitle(
                              title: appLocalizations.bestStudents,
                              fontSize: Get.width * 0.045,
                              lineThickness: 1.5,
                            ),
                          ),
                          Expanded(
                            child: ListView(
                              physics: ClampingScrollPhysics(),
                              padding: const EdgeInsets.all(0),
                              children: [
                                FadeInRight(
                                  delay: Duration(
                                    milliseconds: 500,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: Material(
                                    color: Get.theme.primaryColorDark,
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/images/1.jpg",
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        "إبراهيم الحربي",
                                        style: TextStyle(
                                          color: Get.theme.primaryColorLight,
                                          fontSize: Get.width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "IT سنة ثالثة",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: Get.width * 0.035,
                                        ),
                                      ),
                                      trailing: Text(
                                        "100%",
                                        style: TextStyle(
                                          color: Get.theme.colorScheme.primary,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FadeInRight(
                                  delay: Duration(
                                    milliseconds: 700,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: Material(
                                    color: Get.theme.primaryColorDark,
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/images/1.jpg",
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        "أمجد الشاحذي",
                                        style: TextStyle(
                                          color: Get.theme.primaryColorLight,
                                          fontSize: Get.width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "IT سنة ثالثة",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: Get.width * 0.035,
                                        ),
                                      ),
                                      trailing: Text(
                                        "99%",
                                        style: TextStyle(
                                          color: Get.theme.colorScheme.primary,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                FadeInRight(
                                  delay: Duration(
                                    milliseconds: 900,
                                  ),
                                  curve: Curves.fastOutSlowIn,
                                  duration: Duration(milliseconds: 500),
                                  child: Material(
                                    color: Get.theme.primaryColorDark,
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Image.asset(
                                          "assets/images/1.jpg",
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        "هناء الصيفي",
                                        style: TextStyle(
                                          color: Get.theme.primaryColorLight,
                                          fontSize: Get.width * 0.045,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "IT سنة ثالثة",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: Get.width * 0.035,
                                        ),
                                      ),
                                      trailing: Text(
                                        "95%",
                                        style: TextStyle(
                                          color: Get.theme.colorScheme.primary,
                                          fontSize: Get.width * 0.035,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  scrollController: ScrollController(),
                  closeOnScroll: false,
                  cornerRadius: 10,
                ),
              );
            },
            // style: ButtonStyle(
            //   // padding: MaterialStateProperty.all(EdgeInsets.zero),
            // ),
            child: ListTile(
              leading: Icon(
                Icons.assessment_outlined,
                color: Get.theme.colorScheme.primary,
                size: Get.width * 0.0975, // 40
              ),
              title: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: LanguageController.getCurrentLanguage() == "ar"
                          ? 120
                          : 0,
                      left: LanguageController.getCurrentLanguage() == "ar"
                          ? 0
                          : 120,
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.background,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/1.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: LanguageController.getCurrentLanguage() == "ar"
                          ? 90
                          : 0,
                      left: LanguageController.getCurrentLanguage() == "ar"
                          ? 0
                          : 90,
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.background,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/1.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: LanguageController.getCurrentLanguage() == "ar"
                          ? 60
                          : 0,
                      left: LanguageController.getCurrentLanguage() == "ar"
                          ? 0
                          : 60,
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.background,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/1.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      right: LanguageController.getCurrentLanguage() == "ar"
                          ? 30
                          : 0,
                      left: LanguageController.getCurrentLanguage() == "ar"
                          ? 0
                          : 30,
                    ),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.background,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/1.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Get.theme.colorScheme.background,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/1.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Icon(
                LanguageController.getCurrentLanguage() == "ar"
                    ? Icons.arrow_back_ios_new_rounded
                    : Icons.arrow_forward_ios_rounded,
                color: Get.theme.colorScheme.onPrimary,
                size: Get.width * 0.045,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
