import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/widgets/my_button.dart';

enum ColumnData {
  name,
  tableIndex,
  text,
  width,
  height,
  isSelectButton,
  onPressed,
  tableController,
  canSort,
  columnsCount,
  isNumericColumns,
}

class MyDataColumn extends StatelessWidget {
  final int? tableIndex;
  final String text;
  final double? width;
  final double? height;
  final bool isSelectButton;
  final VoidCallback? onPressed;
  final bool canSort;
  final int columnsCount;
  final bool isNumericColumns;
  final int columnIndex;

  const MyDataColumn({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.isSelectButton = false,
    this.onPressed,
    this.canSort = false,
    this.tableIndex,
    this.columnsCount = 2,
    this.isNumericColumns = false,
    this.columnIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return isNumericColumns
        ? SizedBox(
            width: (Get.width * 0.195), // 80
            height: height ?? Get.width * 0.0975, // 40
            child: MyButton(
              borderRadius: 0,
              onPressed: onPressed ?? () {},
              child: Icon(
                Icons.numbers_rounded,
                color: Get.theme.colorScheme.onSurface,
              ),
            ),
          )
        : isSelectButton
            ? SizedBox(
                width: (Get.width * 0.146), // 60
                height: height ?? Get.width * 0.0975, // 40
                child: MyButton(
                  borderRadius: 0,
                  onPressed: onPressed ?? () {},
                  child: Icon(
                    Get.find<TableController>()
                            .checkTheList(tableIndex: tableIndex!)
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              )
            : SizedBox(
                height: height ?? Get.width * 0.0975,
                child: MyButton(
                  width: width ?? (columnsCount == 1 ? Get.width - 80 : 200),
                  borderRadius: 0,
                  onPressed: (canSort ? onPressed ?? () {} : () {}),
                  child: Row(
                    mainAxisAlignment: _getCross() == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        text,
                        style: TextStyle(
                          color: Get.theme.colorScheme.onSurface,
                          fontSize: Get.width * 0.040,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _getCross() != null
                          ? Icon(
                              _getCross() == true ? Icons.arrow_drop_down_rounded : Icons.arrow_drop_up_rounded,
                              color: Get.theme.colorScheme.onSurface,
                            )
                          : Container(),
                    ],
                  ),
                ),
              );
  }

  bool? _getCross() {
    bool? f = false;
    if (Get.find<TableController>().getColumnsSortTyep(tableIndex!, columnIndex) == null) {
      f = null;
    } else if (Get.find<TableController>()
            .getColumnsSortTyep(tableIndex!, columnIndex) == true) {
      f = true;
    } else {
      f = false;
    }

    if (!canSort) {
      f = null;
    }
    return f;
  }
}
