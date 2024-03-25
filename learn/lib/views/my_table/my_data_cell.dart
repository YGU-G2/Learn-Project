import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDataCell extends StatefulWidget {
  final Widget? child;
  final String? text;
  final Alignment alignment;
  final bool isCheckBox;
  final bool isChecked;
  final double? width;
  final Color? textColor;
  final double? textFontSize;
  final int columnsCount;
  final bool isLongText;

  const MyDataCell({
    super.key,
    this.child,
    this.alignment = Alignment.centerRight,
    this.isCheckBox = false,
    this.isChecked = false,
    this.width,
    this.text,
    this.textColor,
    this.textFontSize,
    this.columnsCount = 2,
    this.isLongText = false,
  });

  @override
  State<MyDataCell> createState() => _MyDataCellState();
}

class _MyDataCellState extends State<MyDataCell> {
  bool showAllText = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      constraints: BoxConstraints(
        minHeight: 45,
      ),
      padding: widget.isCheckBox
          ? EdgeInsets.zero
          : EdgeInsets.all(Get.width * 0.0125),
      width: widget.width ??
          (widget.isCheckBox
              ? 60
              : widget.columnsCount == 1
                  ? Get.width - 80
                  : 200),
      child: Column(
        children: [
          widget.child ??
              Text(
                (widget.text != null)
                    ? (widget.text!.length > 50 && showAllText == false)
                        ? widget.text!.substring(0, 50)
                        : widget.text!
                    : "",
                style: TextStyle(
                  color: widget.textColor ?? Theme.of(context).primaryColorLight,
                  fontSize: widget.textFontSize ?? Get.width * 0.035, // 14
                ),
                textAlign: TextAlign.center,
              ),
          widget.isLongText ? TextButton(
            onPressed: () {
              setState(() {
                showAllText = !showAllText;
              });
            },
            child: Text(showAllText ? "...See Less" : "See More..."),
          ) : Container(),
        ],
      ),
    );
  }
}
