import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn/controller/academic_affairs/education_staff_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:learn/utils/my_alert_dialog.dart';
import 'package:learn/utils/my_bottom_sheet.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/loading.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:learn/widgets/show_info_list_tile.dart';
import 'package:learn/widgets/update_education_staff_fields.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  static String id = "/profile_settings";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return MyScaffold(
      appLocalizations: appLocalizations!,
      body: Padding(
        padding: EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: _firestore
                  .collection('education_staff')
                  .doc(LoginController.educationStaffId)
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
                    FadeInDown(
                      delay: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500),
                      child: BodyTitle(
                        title: appLocalizations.profile,
                      ),
                    ),
                    FlipInY(
                      delay: const Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        appLocalizations.profileImage,
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
                      child: Obx(
                        () => Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            OfflineBuilder(
                              connectivityBuilder: (
                                BuildContext context,
                                ConnectivityResult connectivity,
                                Widget child,
                              ) {
                                CheckInternetConnection.checkTheInternet();
                                if (CheckInternetConnection
                                    .isInternetOnLine.value) {
                                  return CircleAvatar(
                                    radius: Get.width * 0.220, // 90
                                    backgroundImage: NetworkImage(
                                      "${snapshot.data!['educationStaffImage']}",
                                    ),
                                    onBackgroundImageError:
                                        (exception, stackTrace) => Icon(
                                      CupertinoIcons.person,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: Get.width * 0.220, // 90
                                    ),
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                  );
                                } else {
                                  return CircleAvatar(
                                    radius: Get.width * 0.220, // 90
                                    backgroundColor:
                                        Theme.of(context).primaryColorDark,
                                    child: Icon(
                                      CupertinoIcons.person,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: Get.width * 0.220, // 90
                                    ),
                                  );
                                }
                              },
                              child: Loading.getCubeGrid(
                                size: Get.width * 0.062, //25
                              ),
                            ),
                            if (EducationStaffController
                                .isEducationStaffImageUploadLoading.value)
                              CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                radius: Get.width * 0.220, // 90
                                child: Loading.getCubeGrid(
                                  color: Theme.of(context).primaryColorDark,
                                  size: Get.width * 0.073, // 30
                                ),
                              ),
                            Transform.translate(
                              offset: const Offset(-15, -5),
                              child: MyButton(
                                elevation: 0,
                                onPressed: () {
                                  MyBottomSheet.getBottomSheet(
                                    content: Container(
                                      width: Get.width,
                                      height: 200,
                                      color: Theme.of(context).primaryColorDark,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Get.width * 0.05, // 20
                                                  vertical:
                                                      Get.width * 0.025, // 10
                                                ),
                                                child: Text(
                                                  appLocalizations.choose(
                                                    appLocalizations
                                                        .profileImage,
                                                  ),
                                                  style: TextStyle(
                                                    fontSize:
                                                        Get.width * 0.045, // 18
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      Get.width * 0.025, // 10
                                                ),
                                                child: TextButton(
                                                  onPressed: () {
                                                    MyAlertDialog
                                                        .showMyAlertDialog(
                                                      appLocalizations:
                                                          appLocalizations,
                                                      icon: Icons
                                                          .warning_amber_rounded,
                                                      whoDelete:
                                                          appLocalizations
                                                              .profileImage,
                                                      iconColor: Colors.red,
                                                      title: appLocalizations
                                                          .warningMessage,
                                                      onYesBtnPressed: () {
                                                        Get.back();
                                                        EducationStaffController
                                                            .deleteEducationStaffImage();
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.delete_rounded,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    final picker =
                                                        ImagePicker();
                                                    final pickedFile =
                                                        await picker.pickImage(
                                                      source:
                                                          ImageSource.camera,
                                                    );
                                                    if (pickedFile != null) {
                                                      EducationStaffController
                                                          .upLoadEducationStaffImage(
                                                        File(
                                                          pickedFile.path,
                                                        ),
                                                      );
                                                    }
                                                    Get.back();
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Brand(
                                                        Brands.google_images,
                                                        size: 50,
                                                      ),
                                                      Text(
                                                        appLocalizations.camera,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorLight,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 100,
                                                child: TextButton(
                                                  onPressed: () async {
                                                    final picker =
                                                        ImagePicker();
                                                    final pickedFile =
                                                        await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery,
                                                    );
                                                    if (pickedFile != null) {
                                                      EducationStaffController
                                                          .upLoadEducationStaffImage(
                                                        File(
                                                          pickedFile.path,
                                                        ),
                                                      );
                                                    }
                                                    Get.back();
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Brand(
                                                        Brands.ios_photos,
                                                        size: 50,
                                                      ),
                                                      Text(
                                                        appLocalizations.studio,
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColorLight,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.name,
                      text: "${snapshot.data!['educationStaffName']}",
                      icon: Icons.person_rounded,
                      showEditBtn: false,
                      delay: 1100,
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.academicNumber,
                      text: "${snapshot.data!['educationStaffAcademicNumber']}",
                      icon: Icons.person_rounded,
                      showEditBtn: false,
                      delay: 1150,
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.academicDegree,
                      text: EducationStaffController
                          .getEducationStaffAcademicDegree(
                        educationStaffAcademicDegree:
                            "${snapshot.data!['educationStaffAcademicDegree']}",
                        appLocalizations: appLocalizations,
                      ),
                      icon: Icons.school_rounded,
                      showEditBtn: false,
                      delay: 1200,
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.gender,
                      text: EducationStaffController.getEducationStaffGender(
                        educationStaffGender:
                            "${snapshot.data!['educationStaffGender']}",
                        appLocalizations: appLocalizations,
                      ),
                      icon: Icons.group_outlined,
                      showEditBtn: false,
                      delay: 1250,
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.birthDate,
                      text: snapshot.data!['educationStaffBirthDate'],
                      icon: Icons.date_range_rounded,
                      delay: 1300,
                      onEditBtnPressed: () {
                        MyBottomSheet.getBottomSheet(
                          content: UpdateEducationStaffFields(
                            appLocalizations: appLocalizations,
                            snapshot: snapshot,
                            fieldName: "educationStaffBirthDate",
                            fieldsType: UpdateFieldsType.date,
                            title: appLocalizations.birthDate,
                          ),
                        );
                      },
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.jobTitle,
                      text: EducationStaffController.getEducationStaffJobTitle(
                        educationStaffJobTitle:
                            "${snapshot.data!['educationStaffJobTitle']}",
                        appLocalizations: appLocalizations,
                      ),
                      icon: Icons.work_rounded,
                      showEditBtn: false,
                      delay: 1350,
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.email,
                      text: "${snapshot.data!['educationStaffEmail']}",
                      icon: Icons.email_rounded,
                      delay: 1400,
                      onEditBtnPressed: () {
                        MyBottomSheet.getBottomSheet(
                          content: UpdateEducationStaffFields(
                            appLocalizations: appLocalizations,
                            snapshot: snapshot,
                            fieldName: "educationStaffEmail",
                            fieldsType: UpdateFieldsType.email,
                            title: appLocalizations.email,
                            prefix: Icons.email_rounded,
                          ),
                        );
                      },
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.password,
                      text: '*******************',
                      icon: Icons.password_rounded,
                      showEditBtn: true,
                      delay: 1400,
                      onEditBtnPressed: () {
                        MyBottomSheet.getBottomSheet(
                          content: UpdateEducationStaffFields(
                            appLocalizations: appLocalizations,
                            snapshot: snapshot,
                            fieldName: "educationStaffPassword",
                            fieldsType: UpdateFieldsType.password,
                            title: appLocalizations.password,
                            prefix: Icons.password_rounded,
                            height: 400,
                          ),
                        );
                      },
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.aboutYou,
                      text: "${snapshot.data!['educationStaffAbout']}",
                      icon: Icons.person_pin_rounded,
                      showEditBtn: true,
                      delay: 1450,
                      onEditBtnPressed: () {
                        MyBottomSheet.getBottomSheet(
                          content: UpdateEducationStaffFields(
                            appLocalizations: appLocalizations,
                            snapshot: snapshot,
                            fieldName: "educationStaffAbout",
                            fieldsType: UpdateFieldsType.text,
                            title: appLocalizations.aboutYou,
                            prefix: Icons.person_pin_rounded,
                            height: 400,
                            minLines: 5,
                            maxLines: 10,
                            maxLength: 1000,
                          ),
                        );
                      },
                    ),
                    ShowInfoListTile(
                      appLocalizations: appLocalizations,
                      title: appLocalizations.communication,
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
                      showEditBtn: true,
                      delay: 1450,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}