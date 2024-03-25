import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? minWidth;
  final double height;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? splashColor;
  final double elevation;
  final bool isEnable;

  const MyButton({
    super.key,
    required this.child,
    this.width,
    this.onPressed,
    this.borderRadius = 5.0,
    this.height = 40,
    this.backgroundColor,
    this.splashColor,
    this.minWidth,
    this.elevation = 15,
    this.isEnable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
      ),
      width: width ?? 200.0,
      height: height,
      child: MaterialButton(
        disabledColor: Theme.of(context).colorScheme.secondaryContainer,
        elevation: elevation,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 10,
        padding: EdgeInsets.zero,
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        splashColor: splashColor ?? Theme.of(context).colorScheme.secondary,
        colorBrightness: Theme.of(context).colorScheme.brightness,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        onPressed: isEnable ? (onPressed ?? () {}) : null,
        child: child,
      ),
    );
  }
}
