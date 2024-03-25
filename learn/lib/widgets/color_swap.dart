import 'package:flutter/material.dart';

class ColorSwap extends StatelessWidget {
  const ColorSwap({
    super.key,
    required this.colors,
    required this.press,
    required this.isActive,
  });

  final ColorItems colors;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: CircleAvatar(
        backgroundColor: colors.color,
        child: Icon(
          isActive ? Icons.check : null,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}

class ColorItems {
  ColorItems({required this.color, required this.themeNumber});
  final Color color;
  final int themeNumber;
}

List<ColorItems> colorItems = [
  ColorItems(
    color: Color(0xff526ae5),
    themeNumber: 2,
  ),
  ColorItems(
    color: Color(0xffe55252),
    themeNumber: 1,
  ),
  ColorItems(
    color: Color(0xffe5aa52),
    themeNumber: 3,
  ),
  ColorItems(
    color: Color(0xffad52e5),
    themeNumber: 4,
  ),
  ColorItems(
    color: Color(0xff52e5be),
    themeNumber: 5,
  ),
];
