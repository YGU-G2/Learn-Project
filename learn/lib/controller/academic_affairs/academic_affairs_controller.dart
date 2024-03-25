import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/exceptions/add_exceptions.dart';
import 'package:learn/models/education_staff.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:intl/intl.dart';

class AcademicAffairsController extends GetxController {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final RxBool isAddEditEndEducationStaffIsLoading = false.obs;
  static final RxBool isEducationStaffEditBtnEnable = false.obs;
  static final RxBool isEducationStaffEditWaiting = false.obs;
  static final RxString educationStaffWaitingBtn = "".obs;
  static final RxBool isEducationStaffDeleteWaiting = false.obs;
  static final RxString educationStaffSearchValue = "all".obs;

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

  static String _getEducationStaffBirthDateFormat(
      DateTime? educationStaffBirthDate) {
    DateFormat format;
    if (educationStaffBirthDate != null) {
      format = DateFormat("yyyy/MM/dd");
      return format.format(educationStaffBirthDate);
    } else {
      return "";
    }
  }

  static Future<void> addEducationStaff(EducationStaff educationStaff) async {
    isAddEditEndEducationStaffIsLoading.value = true;
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
        'educationStaffBirthDate': _getEducationStaffBirthDateFormat(
          educationStaff.educationStaffBirthDate,
        ),
        'isEducationStaffDeleted': educationStaff.isEducationStaffDeleted,
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
        title:
            LanguageController.getCurrentLanguage() == "ar" ? "خطاء" : "Error",
        message: LanguageController.getCurrentLanguage() == "ar"
            ? "هذا الرقم الأكاديمي موجود مسبقاً"
            : "This Academic Number Already Exists",
        backgroundColor: Color.fromARGB(70, 239, 83, 80),
        colorText: Get.theme.primaryColorLight,
      );
    }
    isAddEditEndEducationStaffIsLoading.value = false;
  }

  static Future<EducationStaff> getEducationStaffById(
      String educationStaffId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('education_staff')
        .doc(educationStaffId)
        .get();
    DateFormat format;
    DateTime? date;
    if (documentSnapshot['educationStaffBirthDate'].isNotEmpty) {
      format = DateFormat('yyyy/MM/dd');
      date = format.parse(documentSnapshot['educationStaffBirthDate']);
    }
    return EducationStaff(
        educationStaffId: documentSnapshot.id,
        educationStaffName: documentSnapshot['educationStaffName'],
        educationStaffAcademicNumber:
            documentSnapshot['educationStaffAcademicNumber'],
        educationStaffAcademicDegree:
            documentSnapshot['educationStaffAcademicDegree'],
        educationStaffGender: documentSnapshot['educationStaffGender'],
        educationStaffBirthDate: date,
        isEducationStaffDeleted: documentSnapshot['isEducationStaffDeleted']);
  }

  static Future<void> editEducationStaff(EducationStaff educationStaff) async {
    isAddEditEndEducationStaffIsLoading.value = true;
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
        'educationStaffBirthDate': _getEducationStaffBirthDateFormat(
          educationStaff.educationStaffBirthDate,
        ),
        'isEducationStaffDeleted': educationStaff.isEducationStaffDeleted,
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
        title:
            LanguageController.getCurrentLanguage() == "ar" ? "خطاء" : "Error",
        message: LanguageController.getCurrentLanguage() == "ar"
            ? "هذا الرقم الأكاديمي موجود مسبقاً"
            : "This Academic Number Already Exists",
        backgroundColor: Color.fromARGB(70, 239, 83, 80),
        colorText: Get.theme.primaryColorLight,
      );
    }
    isAddEditEndEducationStaffIsLoading.value = false;
  }

  static Future<void> deleteEducationStaff({
    required String educationStaffId,
  }) async {
    isEducationStaffDeleteWaiting.value = true;
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
    isEducationStaffDeleteWaiting.value = false;
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
          .where('educationStaffName', arrayContains: value.value.toString() + "\uf8ff")
          .snapshots();
    }
  }

  static Future<void> deleteAllEducationStaff({
    required List<String> educationStaffIds,
  }) async {
    bool f = true;
    var i = 0;
    isEducationStaffDeleteWaiting.value = true;
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
    isEducationStaffDeleteWaiting.value = false;
  }
}
