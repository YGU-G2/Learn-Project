import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettintgsTile extends StatelessWidget {
  const SettintgsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.supTitle,
    this.trailing,
    this.onPressed,
  });

  final IconData icon;
  final String title;
  final String supTitle;
  final Widget? trailing;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ),
          onPressed: onPressed ?? () {},
          child: ListTile(
            leading: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
              size: Get.width * 0.073,
            ),
            title: Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColorLight,
                fontSize: Get.width * 0.040,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              supTitle,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Get.width * 0.035,
              ),
            ),
            trailing: trailing,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.19,
          child: const Divider(
            height: 0,
          ),
        ),
      ],
    );
  }
}
