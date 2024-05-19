import 'package:advance_animated_progress_indicator/advance_animated_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GradesCard extends StatelessWidget {
  const GradesCard({
    super.key,
    this.width,
    required this.title,
    required this.progressLabel,
    required this.totalGrades,
    required this.percentage,
    this.delay = 700,
    required this.appLocalizations,
    this.onPressed,
  });

  final double? width;
  final String title;
  final String progressLabel;
  final double totalGrades;
  final double percentage;
  final int delay;
  final AppLocalizations appLocalizations;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          onPressed: onPressed ?? () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          child: Padding(
            padding: EdgeInsets.all(Get.width * 0.025), // 10
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Get.theme.primaryColorLight,
                    fontSize: Get.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: width ?? Get.width,
                  ),
                  child: AnimatedLinearProgressIndicator(
                    total: totalGrades,
                    label: progressLabel,
                    percentage: percentage / totalGrades,
                    animationDuration: Duration(
                      milliseconds: 1000 + delay,
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
          ),
        ),
      ),
    );
  }
}
