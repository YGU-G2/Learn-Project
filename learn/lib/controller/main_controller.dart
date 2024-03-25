import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  List<RxMap<String, int>> currentPage = [
    {"": 0}.obs
  ];

  void goToPage(int page, PageController pageController, String name) {
    for (var element in currentPage) {
      element[name] = page;
    }
    pageController.jumpToPage(page);
  }

  void animateToPage(int page, PageController pageController, String name) {
    for (var element in currentPage) {
      element[name] = page;
    }
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void addToMap(String name) {
    bool f = true;
    for (var element in currentPage) {
      if (element.containsKey(name)) {
        f = false;
      } 
    }

    if (f) {
      currentPage.add({name : 0}.obs);
    }
  }

  int getPage(String name) {
    for (var element in currentPage) {
      if (element.containsKey(name)) {
        return element[name]!;
      }
    }

    return 0;
  }

  @override
  void onInit() {
    currentPage.clear();
    super.onInit();
  }
}
