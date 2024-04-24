import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagination/flutter_pagination.dart';
import 'package:flutter_pagination/widgets/button_styles.dart';
import 'package:get/get.dart';
import 'package:learn/controller/table_controller.dart';
import 'package:learn/views/my_table/my_data_cell.dart';
import 'package:learn/views/my_table/my_data_column.dart';
import 'package:learn/views/my_table/my_data_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/loading.dart';

typedef VoidCallback = void Function(String);

class MyTable extends StatefulWidget {
  // المتغير الخاص بالترجمة
  final AppLocalizations appLocalizations;

  // متغير لرقم الجدول يجب ان يكون لكل جدول رقم فريد
  final int index;

  // متغير لتحديد هل الجدول يحتوي صفحات او يكون جدول عادي
  final bool isPaginatedData;

  // لتحديد عدد الصفوف في كل صفحة
  final int? rowPerPagesNumber;

  // مصفوف للاعمدة
  final List<Map<ColumnData, dynamic>> columns;

  // مصفوفة للصفوف
  final List<Map> rows;

  // لتحديد هل الجدول يقبل تحديد الصفوف او لا
  final bool enableSelectedColumn;

  // لتحديد هل الجدول يتم ترتيبة حسب الاعمدة
  final bool canSortByColumns;

  // لتحديد هل يتم عرض رأس الجدول او لا
  final bool showHeader;

  // لتحديد ارتفارع رأس الجدول
  final double? headerHeight;

  // لإضافة محتوى لرأس الجدول
  final Widget? header;

  // لتحديد لون رأس الجدول
  final Color? headerColor;

  // لتحديد مده تأخير الجدول للضهور
  final int animatedDelay;

  // لمعرفة هل الجدول قيد الأنتضار
  final bool isWaiting;

  // لمعرفة هل يوجد بيانات او لا
  final bool hasData;

  // لتحديد هل يتم ترقيم الصفوف او لا
  final bool rowsNumbering;

  // لتحديد هل يتم غضهار زر حذف الكل ام لا
  final Widget? deleteAllBtn;

  // الحقل الخاص بالبحث
  final Widget? searchField;

  // هل حقل البحث مفعل
  final bool hasSearchField;

  const MyTable({
    super.key,
    required this.columns,
    required this.rows,
    this.enableSelectedColumn = false,
    this.canSortByColumns = false,
    this.showHeader = false,
    this.headerHeight,
    this.header,
    this.headerColor,
    required this.index,
    this.isPaginatedData = false,
    this.rowPerPagesNumber,
    required this.appLocalizations,
    this.animatedDelay = 700,
    this.isWaiting = true,
    this.hasData = true,
    this.rowsNumbering = true,
    this.deleteAllBtn,
    this.searchField,
    this.hasSearchField = false,
  });

  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  late TableController tableController;

  // لمعرفة هل حقل البحث مفتوح ام لا
  bool isSearchFieldOpen = false;

  @override
  Widget build(BuildContext context) {
    tableController = Get.find<TableController>();
    for (var i = 0; i < tableController.rows.length; i++) {
      if (tableController.rows[i].containsKey(widget.index)) {
        tableController.setRowsSelected(widget.index);
        tableController.rows.removeAt(i);
      }
    }
    Map<int, bool?> _columnsMap() {
      Map<int, bool?> m = {};
      List.generate(widget.columns.length, (index) {
        m.addAll({index: null});
      });
      return m;
    }

    tableController.addTable(
      listRows: {
        widget.index: List.generate(
          widget.rows.length,
          (index) {
            if (tableController
                .getRowsSelected(widget.index)
                .containsKey(widget.rows[index]['id'])) {
              widget.rows[index].addAll({
                "isSelected": tableController.getRowsSelected(
                    widget.index)['${widget.rows[index]['id']}']
              });
            } else {
              widget.rows[index].addAll({"isSelected": false});
            }
            return widget.rows[index];
          },
        ),
      },
      currentTablePage: {widget.index: 1},
      rowPerPages: {widget.index: 0},
      rowPerPagesNumber: {widget.index: 0},
      selectedCount: {widget.index: 0},
      rowsIndex: {widget.index: 0},
      rowsSelected: {widget.index: {}},
      columnsSortTyep: {widget.index: _columnsMap()},
      isEnableSelectedColumn: {widget.index: true},
      isShowNumberingColumn: {widget.index: true},
      isEnableSearch: {widget.index: true},
      isEnablePagination: {widget.index: true},
      tableIndex: widget.index,
    );
    for (var i = 0; i < tableController.rows.length; i++) {
      if (tableController.getisEnablePagination(widget.index)) {
        tableController.rowPerPagesNumber[i][widget.index] =
            widget.rowPerPagesNumber ?? widget.rows.length;
      } else {
        tableController.rowPerPagesNumber[i][widget.index] = widget.rows.length;
      }
    }
    tableController.reSetSortColumns(widget.index, null);
    tableController.selectedCounts(tableIndex: widget.index);
    tableController.getRows(tableIndex: widget.index);
    tableController.setIsEnableSelectedColumn(
      widget.index,
      widget.enableSelectedColumn &&
          tableController.getIsEnableSelectedColumn(
            widget.index,
          ),
    );
    tableController.setIsShowNumberingColumn(
      widget.index,
      widget.rowsNumbering &&
          tableController.getIsShowNumberingColumn(
            widget.index,
          ),
    );
    tableController.setisEnablePagination(
      widget.index,
      widget.isPaginatedData &&
          tableController.getisEnablePagination(
            widget.index,
          ),
    );
    return Container(
      width: Get.width,
      height: 500,
      constraints: BoxConstraints(
        minWidth: Get.width,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Theme.of(context).colorScheme.shadow,
            offset: Offset(5, 5),
          ),
          BoxShadow(
            blurRadius: 10,
            color: Theme.of(context).colorScheme.shadow,
            offset: Offset(-5, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(Get.width * 0.025), // 10
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GetBuilder(
          init: tableController,
          builder: (controller) => Column(
            children: [
              if (widget.showHeader)
                Container(
                  padding: EdgeInsets.all(Get.width * 0.025), // 10
                  width: Get.width,
                  height: widget.headerHeight ??
                      (isSearchFieldOpen
                          ? Get.width * 0.250
                          : Get.width * 0.195), // 102
                  decoration: BoxDecoration(
                    color: widget.headerColor ??
                        Theme.of(context).primaryColorDark,
                  ),
                  child: isSearchFieldOpen
                      ? Row(
                          children: [
                            SizedBox(
                              width: Get.width * 0.0975,
                              height: Get.width * 0.0975,
                              child: TextButton(
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                    EdgeInsets.zero,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isSearchFieldOpen = false;
                                  });
                                },
                                child: Icon(
                                  Icons.close_rounded,
                                  size: Get.width * 0.045,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            widget.searchField ?? Container()
                          ],
                        )
                      : tableController.getSelectedCount(widget.index) == 0
                          ? Container(
                              child: Stack(
                                children: [
                                  widget.header ?? Container(),
                                  Row(
                                    mainAxisAlignment: widget.hasSearchField
                                        ? tableController
                                                .getIsEnableSearch(widget.index)
                                            ? MainAxisAlignment.spaceBetween
                                            : MainAxisAlignment.end
                                        : MainAxisAlignment.end,
                                    children: [
                                      if (tableController.getIsEnableSearch(
                                        widget.index,
                                      ))
                                        if (widget.hasSearchField)
                                          SizedBox(
                                            width: Get.width * 0.0975,
                                            height: Get.width * 0.0975,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                  EdgeInsets.zero,
                                                ),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isSearchFieldOpen = true;
                                                });
                                              },
                                              child: Icon(
                                                Icons.search_rounded,
                                                size: Get.width * 0.045,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                            ),
                                          ),
                                      SizedBox(
                                        width: Get.width * 0.0975,
                                        height: Get.width * 0.0975,
                                        child: PopupMenuButton(
                                          iconSize: Get.width * 0.045, // 18
                                          icon: Icon(
                                            Icons.more_vert_rounded,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                          color: Theme.of(context)
                                              .primaryColorDark,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                          ),
                                          elevation: 10,
                                          shadowColor: Theme.of(context)
                                              .colorScheme
                                              .shadow,
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    widget.appLocalizations
                                                        .sortBy,
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: Get.width *
                                                          0.040, // 16
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.filter_list_rounded,
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    size: Get.width * 0.05,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                tableController
                                                    .setIsEnableSelectedColumn(
                                                  widget.index,
                                                  !tableController
                                                      .getIsEnableSelectedColumn(
                                                    widget.index,
                                                  ),
                                                );
                                                setState(() {});
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    tableController
                                                            .getIsEnableSelectedColumn(
                                                                widget.index)
                                                        ? widget
                                                            .appLocalizations
                                                            .disable(
                                                            widget
                                                                .appLocalizations
                                                                .rowsSelection,
                                                          )
                                                        : widget
                                                            .appLocalizations
                                                            .enable(
                                                            widget
                                                                .appLocalizations
                                                                .rowsSelection,
                                                          ),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: Get.width *
                                                          0.040, // 16
                                                    ),
                                                  ),
                                                  Icon(
                                                    tableController
                                                            .getIsEnableSelectedColumn(
                                                                widget.index)
                                                        ? Icons.toggle_on
                                                        : Icons
                                                            .toggle_off_outlined,
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    size: Get.width * 0.05,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                tableController
                                                    .setIsShowNumberingColumn(
                                                  widget.index,
                                                  !tableController
                                                      .getIsShowNumberingColumn(
                                                    widget.index,
                                                  ),
                                                );
                                                setState(() {});
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    tableController
                                                            .getIsShowNumberingColumn(
                                                                widget.index)
                                                        ? widget
                                                            .appLocalizations
                                                            .hide(
                                                            widget
                                                                .appLocalizations
                                                                .the(
                                                              widget
                                                                  .appLocalizations
                                                                  .numberingColumn,
                                                            ),
                                                          )
                                                        : widget
                                                            .appLocalizations
                                                            .show(
                                                            widget
                                                                .appLocalizations
                                                                .the(
                                                              widget
                                                                  .appLocalizations
                                                                  .numberingColumn,
                                                            ),
                                                          ),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: Get.width *
                                                          0.040, // 16
                                                    ),
                                                  ),
                                                  Icon(
                                                    tableController
                                                            .getIsShowNumberingColumn(
                                                                widget.index)
                                                        ? CupertinoIcons
                                                            .eye_fill
                                                        : CupertinoIcons
                                                            .eye_slash_fill,
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    size: Get.width * 0.05,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (widget.hasSearchField) PopupMenuItem(
                                              onTap: () {
                                                tableController
                                                    .setIsEnableSearch(
                                                  widget.index,
                                                  !tableController
                                                      .getIsEnableSearch(
                                                    widget.index,
                                                  ),
                                                );
                                                setState(() {});
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    tableController
                                                            .getIsEnableSearch(
                                                                widget.index)
                                                        ? widget
                                                            .appLocalizations
                                                            .disable(
                                                            widget
                                                                .appLocalizations
                                                                .the(
                                                              widget
                                                                  .appLocalizations
                                                                  .search,
                                                            ),
                                                          )
                                                        : widget
                                                            .appLocalizations
                                                            .enable(
                                                            widget
                                                                .appLocalizations
                                                                .the(
                                                              widget
                                                                  .appLocalizations
                                                                  .search,
                                                            ),
                                                          ),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: Get.width *
                                                          0.040, // 16
                                                    ),
                                                  ),
                                                  Icon(
                                                    tableController
                                                            .getIsEnableSearch(
                                                      widget.index,
                                                    )
                                                        ? Icons.toggle_on
                                                        : Icons
                                                            .toggle_off_outlined,
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    size: Get.width * 0.05,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                tableController
                                                    .setisEnablePagination(
                                                  widget.index,
                                                  !tableController
                                                      .getisEnablePagination(
                                                    widget.index,
                                                  ),
                                                );
                                                setState(() {});
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    tableController
                                                            .getisEnablePagination(
                                                                widget.index)
                                                        ? widget
                                                            .appLocalizations
                                                            .disable(
                                                            widget
                                                                .appLocalizations
                                                                .the(
                                                              widget
                                                                  .appLocalizations
                                                                  .pagination,
                                                            ),
                                                          )
                                                        : widget
                                                            .appLocalizations
                                                            .enable(
                                                            widget
                                                                .appLocalizations
                                                                .the(
                                                              widget
                                                                  .appLocalizations
                                                                  .pagination,
                                                            ),
                                                          ),
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColorLight,
                                                      fontSize: Get.width *
                                                          0.040, // 16
                                                    ),
                                                  ),
                                                  Icon(
                                                    tableController
                                                            .getisEnablePagination(
                                                      widget.index,
                                                    )
                                                        ? Icons.toggle_on
                                                        : Icons
                                                            .toggle_off_outlined,
                                                    color: Theme.of(context)
                                                        .primaryColorLight,
                                                    size: Get.width * 0.05,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.appLocalizations.rowsSelected(
                                      "${tableController.getSelectedCount(widget.index)}"),
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: Get.width * 0.040,
                                  ),
                                ),
                                widget.deleteAllBtn ?? Container(),
                              ],
                            ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _getColumnIndex(),
                          (index) {
                            return _setColumns(index);
                          },
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Column(
                                children: widget.hasData
                                    ? [
                                        Text(
                                          widget.appLocalizations.noData,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .primaryColorLight,
                                            fontSize: Get.width * 0.05,
                                          ),
                                        )
                                      ]
                                    : widget.isWaiting
                                        ? List.generate(
                                            5,
                                            (index) => _waititngRows(index),
                                          )
                                        : List.generate(
                                            tableController
                                                .getRowPerPagesNumber(
                                              widget.index,
                                            ),
                                            (index) {
                                              if (tableController.getRowsIndex(
                                                      widget.index) >=
                                                  tableController.getRowsLength(
                                                      widget.index)) {
                                                return Container();
                                              }
                                              index = index +
                                                  tableController.getRowsIndex(
                                                      widget.index);
                                              if (index <
                                                  tableController.getRowsLength(
                                                      widget.index)) {
                                                return _rows(index);
                                              } else {
                                                return Container();
                                              }
                                            },
                                          ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (tableController.getisEnablePagination(widget.index))
                FadeIn(
                  delay: Duration(
                    milliseconds: 500,
                  ),
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    width: Get.width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorDark,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Pagination(
                          height: 30,
                          paginateButtonStyles: PaginateButtonStyles(
                            activeBackgroundColor:
                                Theme.of(context).colorScheme.background,
                            activeTextStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                            backgroundColor: Theme.of(context).primaryColorDark,
                            textStyle: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          prevButtonStyles: PaginateSkipButton(
                            buttonBackgroundColor:
                                Theme.of(context).primaryColorDark,
                            icon: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: Theme.of(context).primaryColorLight,
                              size: Get.width * 0.040,
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          nextButtonStyles: PaginateSkipButton(
                            buttonBackgroundColor:
                                Theme.of(context).primaryColorDark,
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Theme.of(context).primaryColorLight,
                              size: Get.width * 0.040,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          onPageChange: (number) {
                            tableController.pageChange(number, widget.index);
                            tableController.getRows(
                              tableIndex: widget.index,
                            );
                          },
                          useGroup: false,
                          totalPage:
                              tableController.getRowPerPages(widget.index),
                          show: tableController.getRowPerPages(widget.index) ==
                                  0
                              ? -1
                              : tableController.getRowPerPages(widget.index) <=
                                      1
                                  ? 0
                                  : 1,
                          currentPage:
                              tableController.getRowPerPages(widget.index) == 0
                                  ? 0
                                  : tableController
                                      .getCurrentTablePage(widget.index),
                        ),
                        Text(
                          widget.appLocalizations.ofPage(
                            "${tableController.getRowPerPages(widget.index)}",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  FadeInRight _rows(int index) {
    return FadeInRight(
      delay: Duration(
        milliseconds: widget.animatedDelay + (index * 100),
      ),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: MyDataRow(
        isWaiting: widget.isWaiting,
        tableIndex: widget.index,
        rowIndex: index,
        onPressed: () {
          if (tableController.getIsEnableSelectedColumn(
            widget.index,
          )) {
            tableController.selectRow(
              index: index,
              tableIndex: widget.index,
            );
          }
        },
        cells: List.generate(
          _getCellIndex(index),
          (index1) {
            if (tableController.getIsEnableSelectedColumn(
                  widget.index,
                ) &&
                tableController.getIsShowNumberingColumn(
                  widget.index,
                ) &&
                index1 == 1) {
              return _numericCell(index);
            }
            if (tableController.getIsEnableSelectedColumn(
                  widget.index,
                ) &&
                index1 == 0) {
              return _checkBoxCell(index);
            } else if (tableController.getIsShowNumberingColumn(
                  widget.index,
                ) &&
                index1 == 0) {
              return _numericCell(index);
            } else {
              return _cells(index, index1);
            }
          },
        ),
      ),
    );
  }

  MyDataCell _checkBoxCell(int index) {
    return MyDataCell(
      columnsCount: widget.columns.length,
      alignment: Alignment.center,
      isCheckBox: true,
      child: tableController.getRow(widget.index)[index]["isSelected"]
          ? Icon(
              Icons.check_box_rounded,
            )
          : Icon(
              Icons.check_box_outline_blank_rounded,
            ),
    );
  }

  FadeInRight _waititngRows(int index) {
    return FadeInRight(
      delay: Duration(
        milliseconds: widget.animatedDelay + (index * 100),
      ),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: MyDataRow(
        isWaiting: widget.isWaiting,
        rowIndex: index,
        tableIndex: widget.index,
        cells: List.generate(
          tableController.getIsEnableSelectedColumn(
            widget.index,
          )
              ? tableController.getIsShowNumberingColumn(
                  widget.index,
                )
                  ? widget.columns.length + 2
                  : widget.columns.length + 1
              : tableController.getIsShowNumberingColumn(
                  widget.index,
                )
                  ? widget.columns.length + 1
                  : widget.columns.length,
          (index1) {
            return _setCells(index1);
          },
        ),
      ),
    );
  }

  Widget _setColumns(int index) {
    if (tableController.getIsEnableSelectedColumn(
          widget.index,
        ) &&
        tableController.getIsShowNumberingColumn(
          widget.index,
        ) &&
        index == 1) {
      return _numericColumns(index);
    }
    if (tableController.getIsEnableSelectedColumn(
          widget.index,
        ) &&
        index == 0) {
      return _selectAllColumns(index);
    } else if (tableController.getIsShowNumberingColumn(
          widget.index,
        ) &&
        index == 0) {
      return _numericColumns(index);
    } else {
      return _columns(index);
    }
  }

  ZoomIn _columns(int index) {
    return ZoomIn(
      delay: Duration(
        milliseconds: widget.animatedDelay + (index * 100),
      ),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: _getColumnData(index),
    );
  }

  MyDataColumn _getColumnData(int index) {
    int how = 0;
    String text = "";
    String name = "";
    bool canSort = false;
    double? width;
    double? height;

    if (tableController.getIsEnableSelectedColumn(
      widget.index,
    )) {
      how++;
    }
    if (tableController.getIsShowNumberingColumn(
      widget.index,
    )) {
      how++;
    }

    if (widget.columns[index - how].containsKey(ColumnData.text)) {
      text = widget.columns[index - how][ColumnData.text];
    }

    if (widget.columns[index - how].containsKey(ColumnData.name)) {
      name = widget.columns[index - how][ColumnData.name];
    }

    if (widget.columns[index - how].containsKey(ColumnData.canSort)) {
      canSort = widget.columns[index - how][ColumnData.canSort];
    }

    if (widget.columns[index - how].containsKey(ColumnData.width)) {
      width = widget.columns[index - how][ColumnData.width].toDouble();
    }

    if (widget.columns[index - how].containsKey(ColumnData.height)) {
      height = widget.columns[index - how][ColumnData.height].toDouble();
    }

    return MyDataColumn(
      text: text,
      canSort: canSort,
      width: width,
      height: height,
      tableIndex: widget.index,
      columnIndex: index - how,
      onPressed: canSort
          ? () => tableController.sortByColumn(
                tableIndex: 1,
                cellsKey: name,
                columnIndex: index - how,
              )
          : () {},
    );
  }

  ZoomIn _selectAllColumns(int index) {
    return ZoomIn(
      delay: Duration(milliseconds: widget.animatedDelay + (index * 100)),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: MyDataColumn(
        columnsCount: widget.columns.length,
        tableIndex: widget.index,
        text: "",
        isSelectButton: true,
        onPressed: () {
          if (tableController.checkTheList(tableIndex: widget.index)) {
            tableController.deselectAll(
              tableIndex: widget.index,
            );
          } else {
            tableController.selectAll(
              tableIndex: widget.index,
            );
          }
        },
      ),
    );
  }

  ZoomIn _numericColumns(int index) {
    return ZoomIn(
      delay: Duration(milliseconds: widget.animatedDelay + (index * 100)),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: MyDataColumn(
        columnsCount: widget.columns.length,
        tableIndex: widget.index,
        text: "",
        isNumericColumns: true,
        isSelectButton: false,
        onPressed: () {},
      ),
    );
  }

  Widget _setCells(int index1) {
    if (tableController.getIsEnableSelectedColumn(
              widget.index,
            ) &
            tableController.getIsShowNumberingColumn(
              widget.index,
            ) &&
        index1 == 1) {
      return _checkBoxWaitingCell(Get.width * 0.195);
    }
    if (tableController.getIsEnableSelectedColumn(
          widget.index,
        ) &&
        index1 == 0) {
      return _checkBoxWaitingCell(Get.width * 0.146);
    } else if (tableController.getIsShowNumberingColumn(
          widget.index,
        ) &&
        index1 == 0) {
      return _checkBoxWaitingCell(Get.width * 0.195);
    } else {
      return _waitingCells(index1);
    }
  }

  MyDataCell _waitingCells(int index1) {
    int how = 0;
    if (tableController.getIsEnableSelectedColumn(
      widget.index,
    )) {
      how++;
    }
    if (tableController.getIsShowNumberingColumn(
      widget.index,
    )) {
      how++;
    }

    return MyDataCell(
      alignment: Alignment.center,
      width: widget.columns[index1 - how].containsKey(ColumnData.width)
          ? widget.columns[index1 - how][ColumnData.width].toDouble()
          : 200,
      isCheckBox: false,
      child: Loading.getCubeGrid(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  MyDataCell _checkBoxWaitingCell(double width) {
    return MyDataCell(
      alignment: Alignment.center,
      isCheckBox: false,
      width: width,
      child: Loading.getCubeGrid(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _cells(int index, int index1) {
    if (!tableController.getIsEnableSelectedColumn(
          widget.index,
        ) &&
        !tableController.getIsShowNumberingColumn(
          widget.index,
        )) {
      index1++;
    }
    if (tableController.getIsEnableSelectedColumn(
          widget.index,
        ) &&
        tableController.getIsShowNumberingColumn(
          widget.index,
        )) {
      index1--;
    }
    return tableController.getRow(widget.index)[index][tableController
        .getRow(widget.index)[index]
        .keys
        .elementAt(index1)
        .toString()];
  }

  MyDataCell _numericCell(int index) {
    return MyDataCell(
      columnsCount: widget.columns.length,
      alignment: Alignment.center,
      isCheckBox: false,
      width: (Get.width * 0.195), // 80
      text: "${index + 1}",
    );
  }

  int _getCellIndex(int index) {
    int count = tableController.getCellLength(
      widget.index,
      index,
    );

    if (!tableController.getIsEnableSelectedColumn(
      widget.index,
    )) {
      count -= 1;
    }
    if (!tableController.getIsShowNumberingColumn(
      widget.index,
    )) {
      count -= 1;
    }
    return count;
  }

  int _getColumnIndex() {
    int count = widget.columns.length;

    if (tableController.getIsEnableSelectedColumn(
      widget.index,
    )) {
      count++;
    }
    if (tableController.getIsShowNumberingColumn(
      widget.index,
    )) {
      count++;
    }
    return count;
  }
}
