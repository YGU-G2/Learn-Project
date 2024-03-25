import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key, required this.press, required this.icon, required this.backgroundColor,
  });

  final VoidCallback press;
  final Icon icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        child: TextButton(
          onPressed: press,
          child: icon,
        ),
      ),
    );
  }
}
