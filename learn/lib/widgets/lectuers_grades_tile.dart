import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LectuersGradesTile extends StatelessWidget {
  const LectuersGradesTile({
    super.key,
    required this.title,
    required this.subjectName,
    required this.teacherName,
    required this.isCheck,
    required this.grades, this.delay = 700,
  });

  final String title;
  final String subjectName;
  final String teacherName;
  final bool isCheck;
  final double grades;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      delay: Duration(
        milliseconds: delay,
      ),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: Material(
        color: Get.theme.primaryColorDark,
        child: ListTile(
          leading: Icon(
            isCheck
                ? Icons.library_add_check_rounded
                : Icons.cancel_presentation_rounded,
            color: Get.theme.colorScheme.primary,
            size: Get.width * 0.073,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Get.theme.primaryColorLight,
              fontSize: Get.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                subjectName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Get.width * 0.035,
                ),
              ),
              Text(
                teacherName,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Get.width * 0.035,
                ),
              ),
            ],
          ),
          trailing: SizedBox(
            width: Get.width * 0.146,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  isCheck ? Icons.check : Icons.close,
                  color: isCheck ? Colors.green : Colors.red,
                  size: Get.width * 0.062,
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Get.theme.colorScheme.primary,
                  child: Text(
                    "$grades",
                    style: TextStyle(
                      color: Get.theme.colorScheme.onSurface,
                      fontSize: Get.width * 0.03,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
