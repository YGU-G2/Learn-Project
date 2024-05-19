import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/exceptions/add_exceptions.dart';
import 'package:learn/models/education_staff.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:learn/utils/format_founctions.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EducationStaffController extends GetxController {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final RxBool isAddAndEditEducationStaffIsLoading = false.obs;
  static final RxBool isEducationStaffUpdateLoading = false.obs;
  static final RxBool isEducationStaffDeleteImageLoading = false.obs;
  static final RxBool isEducationStaffEditBtnEnable = false.obs;
  static final RxString educationStaffWaitingBtn = "".obs;
  static final RxString educationStaffSearchValue = "all".obs;
  static final RxBool isEducationStaffOperationWaiting = false.obs;
  static final RxBool isEducationStaffImageUploadLoading = false.obs;
  static final RxString isEducationStaffOperationType = "".obs;
  static final RxString isEducationStaffOperationId = "".obs;

  static Future<bool> isAcademicNumberExists({
    required String academicNumber,
    String? educationStaffId,
  }) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('education_staff')
        .where(
          'educationStaffAcademicNumber',
          isEqualTo: academicNumber,
        )
        .get();
    if (educationStaffId != null) {
      bool f = true;
      for (var element in querySnapshot.docs) {
        f = element.id == educationStaffId;
      }
      return !f;
    }
    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> addEducationStaff(EducationStaff educationStaff) async {
    isAddAndEditEducationStaffIsLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      if (!await isAcademicNumberExists(
        academicNumber: educationStaff.educationStaffAcademicNumber,
      )) {
        await _firestore
            .collection('education_staff')
            .doc(educationStaff.educationStaffId)
            .set({
          'educationStaffName': educationStaff.educationStaffName,
          'educationStaffAcademicNumber':
              educationStaff.educationStaffAcademicNumber,
          'educationStaffAcademicDegree':
              educationStaff.educationStaffAcademicDegree,
          'educationStaffGender': educationStaff.educationStaffGender,
          'educationStaffBirthDate': FormatFounctions.getStringFromDate(
            date: educationStaff.educationStaffBirthDate,
          ),
          'isEducationStaffDeleted': educationStaff.isEducationStaffDeleted,
          'educationStaffJobTitle': educationStaff.educationStaffJobTitle,
          'educationStaffPassword':
              educationStaff.educationStaffPassword.isEmpty
                  ? "00000000"
                  : educationStaff.educationStaffPassword,
          'educationStaffPermisions': educationStaff.educationStaffPermisions,
          'educationStaffPermisionName':
              educationStaff.educationStaffPermisionName,
          'educationStaffAbout': educationStaff.educationStaffAbout,
          'educationStaffImage': educationStaff.educationStaffImage,
          'educationStaffEmail': educationStaff.educationStaffEmail,
          'educationStaffSocialMedia': educationStaff.educationStaffSocialMedia,
          'isEducationStaffLogined': educationStaff.isEducationStaffLogined,
        }).then((value) {
          MyAlert.snackbar(
            title: LanguageController.getCurrentLanguage() == "ar"
                ? "نجاح"
                : "Success",
            message: LanguageController.getCurrentLanguage() == "ar"
                ? "تمت الأضافة بنجاح"
                : "Added Successfull",
          );
        }).catchError((error) {
          if (error is FirebaseException) {
            AddException.fromCode(error);
          } else {
            MyAlert.snackbar(
              title: LanguageController.getCurrentLanguage() == "ar"
                  ? "خطاء"
                  : "Error",
              message: "$error",
              backgroundColor: Color.fromARGB(70, 239, 83, 80),
              colorText: Get.theme.primaryColorLight,
            );
          }
        });
      } else {
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "هذا الرقم الأكاديمي موجود مسبقاً"
              : "This Academic Number Already Exists",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
      }
    } else {
      CheckInternetConnection.internetAlert();
    }
    isAddAndEditEducationStaffIsLoading.value = false;
  }

  static Future<EducationStaff> getEducationStaffById(
      String educationStaffId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('education_staff')
        .doc(educationStaffId)
        .get();
    return EducationStaff(
      educationStaffId: documentSnapshot.id,
      educationStaffName: documentSnapshot['educationStaffName'],
      educationStaffAcademicNumber:
          documentSnapshot['educationStaffAcademicNumber'],
      educationStaffAcademicDegree:
          documentSnapshot['educationStaffAcademicDegree'],
      educationStaffGender: documentSnapshot['educationStaffGender'],
      educationStaffBirthDate: FormatFounctions.getDateFromString(
        string: documentSnapshot['educationStaffBirthDate'],
      ),
      isEducationStaffDeleted: documentSnapshot['isEducationStaffDeleted'],
      educationStaffJobTitle: documentSnapshot['educationStaffJobTitle'],
      educationStaffPassword: documentSnapshot['educationStaffPassword'],
      educationStaffPermisions: documentSnapshot['educationStaffPermisions'],
      educationStaffPermisionName:
          documentSnapshot['educationStaffPermisionName'],
      educationStaffAbout: documentSnapshot['educationStaffAbout'],
      educationStaffEmail: documentSnapshot['educationStaffEmail'],
      educationStaffImage: documentSnapshot['educationStaffImage'],
      educationStaffSocialMedia: documentSnapshot['educationStaffSocialMedia'],
      isEducationStaffLogined: documentSnapshot['isEducationStaffLogined'],
    );
  }

  static Future<void> updateEducationStaff(
    String educationStaffId,
    Map<Object, Object> changes,
  ) async {
    isEducationStaffUpdateLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      await _firestore
          .collection('education_staff')
          .doc(educationStaffId)
          .update(changes)
          .catchError((error) {
        if (error is FirebaseException) {
          AddException.fromCode(error);
        } else {
          MyAlert.snackbar(
            title: LanguageController.getCurrentLanguage() == "ar"
                ? "خطاء"
                : "Error",
            message: "$error",
            backgroundColor: Color.fromARGB(70, 239, 83, 80),
            colorText: Get.theme.primaryColorLight,
          );
        }
      });
    } else {
      CheckInternetConnection.internetAlert();
    }
    isEducationStaffUpdateLoading.value = false;
  }

  static Future<void> editEducationStaff(EducationStaff educationStaff) async {
    isAddAndEditEducationStaffIsLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      if (!await isAcademicNumberExists(
        academicNumber: educationStaff.educationStaffAcademicNumber,
        educationStaffId: educationStaff.educationStaffId,
      )) {
        await _firestore
            .collection('education_staff')
            .doc(educationStaff.educationStaffId)
            .update({
          'educationStaffName': educationStaff.educationStaffName,
          'educationStaffAcademicNumber':
              educationStaff.educationStaffAcademicNumber,
          'educationStaffAcademicDegree':
              educationStaff.educationStaffAcademicDegree,
          'educationStaffGender': educationStaff.educationStaffGender,
          'educationStaffBirthDate': FormatFounctions.getStringFromDate(
            date: educationStaff.educationStaffBirthDate,
          ),
          'isEducationStaffDeleted': educationStaff.isEducationStaffDeleted,
          'educationStaffJobTitle': educationStaff.educationStaffJobTitle,
          'educationStaffPassword':
              educationStaff.educationStaffPassword.isEmpty
                  ? "00000000"
                  : educationStaff.educationStaffPassword,
          'educationStaffPermisions': educationStaff.educationStaffPermisions,
          'educationStaffPermisionName':
              educationStaff.educationStaffPermisionName,
          'educationStaffAbout': educationStaff.educationStaffAbout,
          'educationStaffImage': educationStaff.educationStaffImage,
          'educationStaffEmail': educationStaff.educationStaffEmail,
          'educationStaffSocialMedia': educationStaff.educationStaffSocialMedia,
          'isEducationStaffLogined': educationStaff.isEducationStaffLogined,
        }).then((value) {
          MyAlert.snackbar(
            title: LanguageController.getCurrentLanguage() == "ar"
                ? "نجاح"
                : "Success",
            message: LanguageController.getCurrentLanguage() == "ar"
                ? "تم التعديل بنجاح"
                : "ُEditted Successfull",
          );
        }).catchError((error) {
          if (error is FirebaseException) {
            AddException.fromCode(error);
          } else {
            MyAlert.snackbar(
              title: LanguageController.getCurrentLanguage() == "ar"
                  ? "خطاء"
                  : "Error",
              message: "$error",
              backgroundColor: Color.fromARGB(70, 239, 83, 80),
              colorText: Get.theme.primaryColorLight,
            );
          }
        });
      } else {
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "هذا الرقم الأكاديمي موجود مسبقاً"
              : "This Academic Number Already Exists",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
      }
    } else {
      CheckInternetConnection.internetAlert();
    }
    isAddAndEditEducationStaffIsLoading.value = false;
  }

  static Future<void> deleteEducationStaff({
    required String educationStaffId,
  }) async {
    isEducationStaffOperationWaiting.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      await _firestore
          .collection('education_staff')
          .doc(educationStaffId)
          .update({
        'isEducationStaffDeleted': true,
      }).then((value) {
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "نجاح"
              : "Success",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "تم الحذف بنجاح"
              : "ُEditted Successfull",
        );
      }).catchError(
        (error) {
          if (error is FirebaseException) {
            AddException.fromCode(error);
          } else {
            MyAlert.snackbar(
              title: LanguageController.getCurrentLanguage() == "ar"
                  ? "خطاء"
                  : "Error",
              message: "$error",
              backgroundColor: Color.fromARGB(70, 239, 83, 80),
              colorText: Get.theme.primaryColorLight,
            );
          }
        },
      );
    } else {
      CheckInternetConnection.internetAlert();
    }
    isEducationStaffOperationWaiting.value = false;
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>>? getEducationStaffData(
    RxString value,
  ) {
    if (value.value == "all") {
      return FirebaseFirestore.instance
          .collection('education_staff')
          .where(
            'isEducationStaffDeleted',
            isEqualTo: false,
          )
          .snapshots();
    } else {
      return FirebaseFirestore.instance
          .collection('education_staff')
          .where(
            'isEducationStaffDeleted',
            isEqualTo: false,
          )
          // .where('educationStaffName', isGreaterThanOrEqualTo: value.value)
          // .where('educationStaffName', isLessThanOrEqualTo: value.value + '\uf8ff')
          .where('educationStaffName',
              arrayContains: value.value.toString() + "\uf8ff")
          .snapshots();
    }
  }

  static Future<void> deleteAllEducationStaff({
    required List<String> educationStaffIds,
  }) async {
    isEducationStaffOperationWaiting.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      bool f = true;
      var i = 0;
      for (i; i < educationStaffIds.length; i++) {
        await _firestore
            .collection('education_staff')
            .doc(educationStaffIds[i])
            .update({
          'isEducationStaffDeleted': true,
        }).then((value) {
          f = true;
        }).catchError(
          (error) {
            f = false;
            if (error is FirebaseException) {
              AddException.fromCode(error);
            } else {
              MyAlert.snackbar(
                title: LanguageController.getCurrentLanguage() == "ar"
                    ? "خطاء"
                    : "Error",
                message: "$error",
                backgroundColor: Color.fromARGB(70, 239, 83, 80),
                colorText: Get.theme.primaryColorLight,
              );
            }
          },
        );
      }
      if (f) {
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "نجاح"
              : "Success",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "تم حذف $i صفوف بنجاح"
              : "Deleted $i Rows Successfull",
        );
      }
    } else {
      CheckInternetConnection.internetAlert();
    }
    isEducationStaffOperationWaiting.value = false;
  }

  static String getEducationStaffAcademicDegree({
    required String educationStaffAcademicDegree,
    required AppLocalizations appLocalizations,
  }) {
    if (educationStaffAcademicDegree == "Professor") {
      return appLocalizations.professor;
    } else if (educationStaffAcademicDegree == "Doctorate") {
      return appLocalizations.doctorate;
    } else {
      return appLocalizations.bachelor;
    }
  }

  static String getEducationStaffGender({
    required String educationStaffGender,
    required AppLocalizations appLocalizations,
  }) {
    if (educationStaffGender == "male") {
      return appLocalizations.male;
    } else {
      return appLocalizations.female;
    }
  }

  static String getEducationStaffJobTitle({
    required String educationStaffJobTitle,
    required AppLocalizations appLocalizations,
  }) {
    if (educationStaffJobTitle == "Professor") {
      return appLocalizations.professor;
    } else if (educationStaffJobTitle == "Teacher") {
      return appLocalizations.teacher;
    } else {
      return appLocalizations.doctor;
    }
  }

  static Future<void> upLoadEducationStaffImage(File imageFile) async {
    isEducationStaffImageUploadLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      try {
        String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference storageRef =
            _storage.ref().child('education_staff_images/$fileName');
        UploadTask uploadTask = storageRef.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask;
        String imageUrl = await taskSnapshot.ref.getDownloadURL();
        DocumentSnapshot documentSnapshot = await _firestore
            .collection('education_staff')
            .doc(LoginController.educationStaffId)
            .get();
        await _firestore
            .collection('education_staff')
            .doc(LoginController.educationStaffId)
            .update({'educationStaffImage': imageUrl});
        if (documentSnapshot['educationStaffImage'].isNotEmpty) {
          Reference prevImageRef =
              _storage.refFromURL(documentSnapshot['educationStaffImage']);
          prevImageRef.delete();
        }
      } catch (error) {
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: "Error uploading image to Firebase: $error",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
      }
    } else {
      CheckInternetConnection.internetAlert();
    }
    isEducationStaffImageUploadLoading.value = false;
  }

  static Future<void> deleteEducationStaffImage() async {
    isEducationStaffDeleteImageLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      DocumentSnapshot documentSnapshot = await _firestore
          .collection('education_staff')
          .doc(LoginController.educationStaffId)
          .get();
      await _firestore
          .collection('education_staff')
          .doc(LoginController.educationStaffId)
          .update({'educationStaffImage': ''});
      if (documentSnapshot['educationStaffImage'].isNotEmpty) {
        Reference prevImageRef =
            _storage.refFromURL(documentSnapshot['educationStaffImage']);
        prevImageRef.delete();
        Get.back();
      }
    } else {
      CheckInternetConnection.internetAlert();
    }
    isEducationStaffDeleteImageLoading.value = false;
  }
}
