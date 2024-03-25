import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/main_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BottomNavigationBarItems extends StatelessWidget {
  final String name;
  final int page;
  final String text;
  final IconData icon;
  final MainController mainController;
  final PageController pageController;

  const BottomNavigationBarItems({
    super.key,
    required this.page,
    required this.text,
    required this.icon,
    required this.mainController,
    required this.pageController,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ZoomTapAnimation(
        onTap: () => mainController.goToPage(page, pageController, name),
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: mainController.getPage(name) == page
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                text,
                style: TextStyle(
                  color: mainController.getPage(name) == page
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimary,
                  fontSize: 14,
                  fontWeight: mainController.getPage(name) == page
                      ? FontWeight.w600
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
