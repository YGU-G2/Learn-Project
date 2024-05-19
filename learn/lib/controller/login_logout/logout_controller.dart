import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/exceptions/add_exceptions.dart';
import 'package:learn/screens/home/home.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final RxBool isLogoutLoading = false.obs;

  static Future<void> logout() async {
    isLogoutLoading.value = true;
    if (CheckInternetConnection.isInternetOnLine.value) {
      if (LoginController.isLogined.value) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await _firestore
            .collection('education_staff')
            .doc(LoginController.educationStaffId)
            .update({
          'isEducationStaffLogined': false,
        }).then((value) async {
          await prefs.setBool(LoginController.loginKey, false);
          await prefs.setString(LoginController.userIdKey, '');
          LoginController.isLogined.value = false;
          LoginController.educationStaffId = '';
          Get.offAllNamed(Home.id);
          MyAlert.snackbar(
            title: LanguageController.getCurrentLanguage() == "ar"
                ? "نجاح"
                : "Success",
            message: LanguageController.getCurrentLanguage() == "ar"
                ? "تم تسجيل الخروج بنجاح"
                : "Logout Successfull",
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
      } 
    } else {
      CheckInternetConnection.internetAlert();
    }
    isLogoutLoading.value = false;
  }
}
