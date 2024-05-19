import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/exceptions/add_exceptions.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginController extends GetxController {
  static final appLocalizations = AppLocalizations.of(Get.context!);

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String loginKey = "loginKey";
  static const String userIdKey = "userIdKey";
  static RxBool isLogined = false.obs;
  static final RxBool isLoginLoading = false.obs;
  static String educationStaffId = '';

  static Future<void> login(String academicNumber, String password) async {
    isLoginLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      QuerySnapshot querySnapshot = await _firestore
          .collection('education_staff')
          .where(
            'educationStaffAcademicNumber',
            isEqualTo: academicNumber,
          )
          .where(
            'educationStaffPassword',
            isEqualTo: password,
          )
          .where(
            'isEducationStaffDeleted',
            isEqualTo: false,
          )
          .get();
      if (querySnapshot.docs.isNotEmpty &&
          !querySnapshot.docs.first['isEducationStaffLogined']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await _firestore
            .collection('education_staff')
            .doc(querySnapshot.docs.first.id)
            .update({
          'isEducationStaffLogined': true,
        }).then((value) async {
          await prefs.setBool(loginKey, true);
          await prefs.setString(userIdKey, querySnapshot.docs.first.id);
          educationStaffId = querySnapshot.docs.first.id;

          isLogined.value = true;
          Get.offAllNamed(Home.id);
          MyAlert.snackbar(
            title: LanguageController.getCurrentLanguage() == "ar"
                ? "نجاح"
                : "Success",
            message: LanguageController.getCurrentLanguage() == "ar"
                ? "تم تسجيل الدخول بنجاح"
                : "Login Successfull",
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
      } else if (querySnapshot.docs.first['isEducationStaffLogined']) {
        isLogined.value = false;
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "هذا الحساب قام بتسجيل الدخول من قبل"
              : "This Account Has Already Been Logged in",
          backgroundColor: const Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
      } else {
        isLogined.value = false;
        MyAlert.snackbar(
          title: LanguageController.getCurrentLanguage() == "ar"
              ? "خطاء"
              : "Error",
          message: LanguageController.getCurrentLanguage() == "ar"
              ? "الرقم الأكاديمي او كلمة السر غير صحيحة"
              : "The Academic Number or Password Is Incorrect",
          backgroundColor: const Color.fromARGB(70, 239, 83, 80),
          colorText: Get.theme.primaryColorLight,
        );
      }
    } else {
      CheckInternetConnection.internetAlert();
    }
    isLoginLoading.value = false;
  }

  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    educationStaffId = await prefs.getString(userIdKey) ?? '';

    return prefs.getBool(loginKey) ?? false;
  }
}
