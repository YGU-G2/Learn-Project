import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/table_controller.dart';

class MyDataRow extends StatelessWidget {
  final List<Widget> cells;
  final int rowIndex;
  final int tableIndex;
  final VoidCallback? onPressed;
  final bool isWaiting;

  const MyDataRow({
    super.key,
    required this.cells,
    required this.rowIndex,
    this.onPressed,
    required this.tableIndex,
    this.isWaiting = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWaiting
          ? Get.theme.primaryColorDark
          : Get.find<TableController>().getRow(tableIndex)[rowIndex]
                  ["isSelected"]
              ? Get.theme.colorScheme.background
              : Get.theme.primaryColorDark,
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(LinearBorder.none),
        ),
        onPressed: onPressed ?? () {},
        child: Row(
          children: cells,
        ),
      ),
    );
  }
}
