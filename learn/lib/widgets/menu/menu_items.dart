import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItems {
  MenuItems({
    required this.title,
    required this.icon,
    required this.key,
  });

  final String title;
  final IconData icon;
  final List<String> key;
}