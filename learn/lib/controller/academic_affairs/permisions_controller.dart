import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/exceptions/add_exceptions.dart';
import 'package:learn/models/permisions.dart';
import 'package:learn/utils/my_alert.dart';

class PermisionsController extends GetxController {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final RxBool isAddAndEditPermisionIsLoading = false.obs;
  static final RxBool isPermisionOperationWaiting = false.obs;
  static final RxString isPermisionOperationType = "".obs;
  static final RxString isPermisionOperationId = "".obs;
  static final RxBool isPermisionEditBtnEnable = false.obs;

  static Future<Permisions> getPermisionById(
    String permisionId,
  ) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('permisions')
        .doc(permisionId)
        .get();
    return Permisions(
      permisionId: documentSnapshot.id,
      permisionName: documentSnapshot['permisionName'],
      permisionShowUniversityData:
          documentSnapshot['permisionShowUniversityData'],
      permisionEditUniversityData:
          documentSnapshot['permisionEditUniversityData'],
      permisionShowColleges: documentSnapshot['permisionShowColleges'],
      permisionAddColleges: documentSnapshot['permisionAddColleges'],
      permisionEditColleges: documentSnapshot['permisionEditColleges'],
      permisionDeleteColleges: documentSnapshot['permisionDeleteColleges'],
      permisionShowNews: documentSnapshot['permisionShowNews'],
      permisionAddNews: documentSnapshot['permisionAddNews'],
      permisionEditNews: documentSnapshot['permisionEditNews'],
      permisionDeleteNews: documentSnapshot['permisionDeleteNews'],
      permisionShowActivitys: documentSnapshot['permisionShowActivitys'],
      permisionAddActivitys: documentSnapshot['permisionAddActivitys'],
      permisionEditActivitys: documentSnapshot['permisionEditActivitys'],
      permisionDeleteActivitys: documentSnapshot['permisionDeleteActivitys'],
      permisionShowAcademicStaff:
          documentSnapshot['permisionShowAcademicStaff'],
      permisionAddAcademicStaff: documentSnapshot['permisionAddAcademicStaff'],
      permisionEditAcademicStaff:
          documentSnapshot['permisionEditAcademicStaff'],
      permisionDeleteAcademicStaff:
          documentSnapshot['permisionDeleteAcademicStaff'],
      isPermisionDeleted: documentSnapshot['isPermisionDeleted'],
    );
  }

  static Future<bool> isPermisionExists({
    required String permisionId,
  }) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('permisions')
        .where(
          'permisionId',
          isEqualTo: permisionId,
        )
        .get();
    return querySnapshot.docs.isNotEmpty;
  }

  static Future<void> addPermisions(Permisions permisions) async {
    isAddAndEditPermisionIsLoading.value = true;
    if (!await isPermisionExists(
      permisionId: permisions.permisionId,
    )) {
      await _firestore
          .collection('permisions')
          .doc(permisions.permisionId)
          .set({
        'permisionName': permisions.permisionName,
        'permisionShowUniversityData': permisions.permisionShowUniversityData,
        'permisionEditUniversityData': permisions.permisionEditUniversityData,
        'permisionShowColleges': permisions.permisionShowColleges,
        'permisionAddColleges': permisions.permisionAddColleges,
        'permisionEditColleges': permisions.permisionEditColleges,
        'permisionDeleteColleges': permisions.permisionDeleteColleges,
        'permisionShowNews': permisions.permisionShowNews,
        'permisionAddNews': permisions.permisionAddNews,
        'permisionEditNews': permisions.permisionEditNews,
        'permisionDeleteNews': permisions.permisionShowNews,
        'permisionShowActivitys': permisions.permisionShowActivitys,
        'permisionAddActivitys': permisions.permisionAddActivitys,
        'permisionEditActivitys': permisions.permisionEditActivitys,
        'permisionDeleteActivitys': permisions.permisionDeleteActivitys,
        'permisionShowAcademicStaff': permisions.permisionShowAcademicStaff,
        'permisionAddAcademicStaff': permisions.permisionAddAcademicStaff,
        'permisionEditAcademicStaff': permisions.permisionEditAcademicStaff,
        'permisionDeleteAcademicStaff': permisions.permisionDeleteAcademicStaff,
        'isPermisionDeleted': permisions.isPermisionDeleted,
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
            ? "اسم الصلاحية هذه موجود مسبقاً"
            : "This Permision Name Already Exists",
        backgroundColor: Color.fromARGB(70, 239, 83, 80),
        colorText: Get.theme.primaryColorLight,
      );
    }
    isAddAndEditPermisionIsLoading.value = false;
  }

  static Future<void> editPermisions(Permisions permisions) async {
    isAddAndEditPermisionIsLoading.value = true;
    if (!await isPermisionExists(
      permisionId: permisions.permisionId,
    )) {
      await _firestore
          .collection('permisions')
          .doc(permisions.permisionId)
          .update({
        'permisionName': permisions.permisionName,
        'permisionShowUniversityData': permisions.permisionShowUniversityData,
        'permisionEditUniversityData': permisions.permisionEditUniversityData,
        'permisionShowColleges': permisions.permisionShowColleges,
        'permisionAddColleges': permisions.permisionAddColleges,
        'permisionEditColleges': permisions.permisionEditColleges,
        'permisionDeleteColleges': permisions.permisionDeleteColleges,
        'permisionShowNews': permisions.permisionShowNews,
        'permisionAddNews': permisions.permisionAddNews,
        'permisionEditNews': permisions.permisionEditNews,
        'permisionDeleteNews': permisions.permisionShowNews,
        'permisionShowActivitys': permisions.permisionShowActivitys,
        'permisionAddActivitys': permisions.permisionAddActivitys,
        'permisionEditActivitys': permisions.permisionEditActivitys,
        'permisionDeleteActivitys': permisions.permisionDeleteActivitys,
        'permisionShowAcademicStaff': permisions.permisionShowAcademicStaff,
        'permisionAddAcademicStaff': permisions.permisionAddAcademicStaff,
        'permisionEditAcademicStaff': permisions.permisionEditAcademicStaff,
        'permisionDeleteAcademicStaff': permisions.permisionDeleteAcademicStaff,
        'isPermisionDeleted': permisions.isPermisionDeleted,
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
            ? "اسم الصلاحية هذه موجود مسبقاً"
            : "This Permision Name Already Exists",
        backgroundColor: Color.fromARGB(70, 239, 83, 80),
        colorText: Get.theme.primaryColorLight,
      );
    }
    isAddAndEditPermisionIsLoading.value = false;
  }

  static Future<void> deletePermisions({
    required String permisionId,
  }) async {
    isPermisionOperationWaiting.value = true;
    await _firestore
        .collection('permisions')
        .doc(permisionId)
        .update({
      'isPermisionDeleted': true,
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
    isPermisionOperationWaiting.value = false;
  }
}
