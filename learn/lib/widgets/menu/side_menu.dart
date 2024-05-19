import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/academic_affairs/education_staff_controller.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/controller/login_logout/login_controller.dart';
import 'package:learn/controller/login_logout/logout_controller.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:learn/utils/my_alert.dart';
import 'package:learn/utils/my_alert_dialog.dart';
import 'package:learn/widgets/color_swap.dart';
import 'package:learn/widgets/loading.dart';
import 'package:learn/widgets/menu/menu_items.dart';
import 'package:learn/widgets/menu/side_menu_tile.dart';
import 'package:learn/widgets/menu/user_info_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatefulWidget {
  final List MenuItemsList;
  final AppLocalizations? appLocalizations;

  const SideMenu({
    super.key,
    required this.MenuItemsList,
    this.appLocalizations,
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final MainController mainController = Get.find<MainController>();
  ColorItems selectedColor = colorItems.first;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: LanguageController.getCurrentLanguage() == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            right: LanguageController.getCurrentLanguage() == "ar" ? 5 : 0,
            left: LanguageController.getCurrentLanguage() == "ar" ? 0 : 5,
            top: 45,
          ),
          width: 288,
          height: double.infinity,
          color: Theme.of(context).primaryColorDark,
          child: Column(
            children: [
              Expanded(
                flex: LoginController.isLogined.value ? 2 : 1,
                child: StreamBuilder(
                  stream: LoginController.isLogined.value
                      ? _firestore
                          .collection('education_staff')
                          .doc(LoginController.educationStaffId)
                          .snapshots()
                      : null,
                  builder: (context, snapshot) {
                    // if (snapshot.data == null) {
                    //   return SizedBox(
                    //     width: Get.width,
                    //     height: Get.height / 2,
                    //     child: Center(
                    //       child: Loading.getCubeGrid(
                    //         size: Get.width * 0.0975,
                    //         color: Theme.of(context).colorScheme.primary,
                    //       ),
                    //     ),
                    //   );
                    // }
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
                    return UserInfoTap(
                      currentColor: selectedColor,
                      mainController: mainController,
                      name: snapshot.data == null
                          ? ""
                          : "${snapshot.data!['educationStaffName']}",
                      profission: snapshot.data == null
                          ? ""
                          : EducationStaffController.getEducationStaffJobTitle(
                              educationStaffJobTitle:
                                  "${snapshot.data!['educationStaffJobTitle']}",
                              appLocalizations: widget.appLocalizations!,
                            ),
                      imagePath: snapshot.data == null
                          ? ""
                          : "${snapshot.data!['educationStaffImage']}",
                    );
                  },
                ),
              ),
              Expanded(
                flex: LoginController.isLogined.value ? 4 : 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      widget.MenuItemsList.length,
                      (index) => widget.MenuItemsList[index],
                    ),
                  ),
                ),
              ),
              if (LoginController.isLogined.value)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          height: 0,
                        ),
                      ),
                      Obx(
                        () => SideMenuTile(
                          mune: MenuItems(
                              title: widget.appLocalizations!.logout,
                              icon: Icons.logout_rounded,
                              key: [],
                              trailing: LogoutController.isLogoutLoading.value
                                  ? Loading.getCubeGrid(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )
                                  : null),
                          press: () {
                            MyAlertDialog.showMyAlertDialog(
                              appLocalizations: widget.appLocalizations!,
                              icon: Icons.info_outline_rounded,
                              isDeleteAlert: false,
                              content: widget.appLocalizations!.logoutSure,
                              iconColor: Colors.blue,
                              onYesBtnPressed: () {
                                Get.back();
                                LogoutController.logout();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
