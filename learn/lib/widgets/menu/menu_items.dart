import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItems {
  MenuItems({
    required this.key,
    required this.title,
    required this.icon,
    this.trailing,
  });

  final String title;
  final IconData icon;
  final List<String> key;
  final Widget? trailing;
}