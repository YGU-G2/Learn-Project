import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDate extends StatelessWidget {
  final String date;

  const ChatDate({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Get.width * 0.025),
        child: Text(
          date,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
            fontSize: Get.width * 0.035, // 14
          ),
        ),
      ),
    );
  }
}
