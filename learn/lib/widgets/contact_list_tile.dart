import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactListTile({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurface,
        size: Get.width * 0.05,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: Get.width * 0.035,
        ),
      ),
    );
  }
}
