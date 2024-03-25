import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/utils/my_alert.dart';

class AddException {
  static fromCode(FirebaseException e) {
    switch (e.code) {
      case 'cancelled':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "تم إلغاء العملية"
              : "The Operation Has Been Cancelled",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'unknown':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "حدث خطاء غير متوقع"
              : "An Unexpected Error Occurred",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'invalid-argument':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "القيمة التي تم إدخالها غير صالحة"
              : "The Value Entered Is Invalid",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'deadline-exceeded':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "إنتهت المهلة الزمنية"
              : "The Time Limit Has Expired",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'not-found':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "الوثيقة غير موجودة"
              : "The Document Dose Not Exist",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'already-exists':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "الوثيقة موجودة بالفعل ولا يمكن إعادة إنشائها"
              : "The Document Already Exist and Cannot Be Recreated",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'permission-denied':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "تم رفض الوصول لقاعدة البيانات"
              : "Database Access Is Denied",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'aborted':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "تم إلغاء العملية بسبب تعارض مع عملية أخرى"
              : "The Operation Was Canceled Due To a Conflict With an Another Opration",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'out-of-range':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "القيمة خارج النطاق المسموح"
              : "The Value Is Outside The Allowed Range",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'unimplemented':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "الوضيفة غير مطبقة"
              : "Function Not Applied",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'unavailable':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "الخدمة غير متاحة حالياً"
              : "The Service Is Currently Unavailable",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'data-loss':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "حدث فقدان للبيانات"
              : "Data Loss Has Occurred",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      case 'unauthenticated':
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "المستخدم غير مصادق علية"
              : "The User Is Not authenticated",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
        break;
      default:
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "حدث خطاء غير مسجل"
              : "An Unregistered Error Occurred",
          backgroundColor: Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
    }
  }
}
