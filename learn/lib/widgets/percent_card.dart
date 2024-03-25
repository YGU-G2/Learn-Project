import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class PercentCard extends StatelessWidget {
  const PercentCard({
    super.key,
    required this.appLocalizations,
    required this.title,
    required this.icon,
    required this.currentValue,
    required this.total,
  });

  final AppLocalizations? appLocalizations;
  final String title;
  final IconData icon;
  final int currentValue;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Get.theme.colorScheme.primary,
                  size: Get.width * 0.075,
                ),
                SizedBox(
                  width: Get.width * 0.025,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorLight,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.85,
                  child: AnimatedLinearProgressIndicator(
                    total: total,
                    label: appLocalizations!.progressInLectures,
                    percentage: currentValue / total,
                    animationDuration: const Duration(
                      seconds: 1,
                    ),
                    labelStyle: TextStyle(
                      color: Get.theme.primaryColorLight,
                      fontSize: Get.width * 0.040,
                    ),
                    indicatorBackgroundColor:
                        Get.theme.colorScheme.onBackground,
                    indicatorColor: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
