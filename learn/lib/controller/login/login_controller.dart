import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String loginKey = "loginKey";
  static bool isLogined = false;
  static final RxBool isLoginIsLoading = false.obs;

  static Future<void> login(String academicNumber, String password) async {
    isLoginIsLoading.value = true;
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
    if (querySnapshot.docs.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(loginKey, true);
      isLogined = true;
      Get.offAllNamed(Home.id);
      MyAlert.snackbar(
        title: LanguageController.getCurrentLanguage() == "ar"
            ? "نجاح"
            : "Success",
        message: LanguageController.getCurrentLanguage() == "ar"
            ? "تم تسجيل الدخول بنجاح"
            : "Login Successfull",
      );
    } else {
      isLogined = false;
      MyAlert.snackbar(
        title:
            LanguageController.getCurrentLanguage() == "ar" ? "خطاء" : "Error",
        message: LanguageController.getCurrentLanguage() == "ar"
            ? "الرقم الأكاديمي او كلمة السر غير صحيحة"
            : "The Academic Number or Password Is Incorrect",
        backgroundColor: const Color.fromARGB(70, 239, 83, 80),
        colorText: Get.theme.primaryColorLight,
      );
    }
    isLoginIsLoading.value = false;
  }

  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(loginKey) ?? false;
  }
}
