import 'package:get/get.dart';

class TableController extends GetxController {
  // للاحتفاض بجميع الصفوف لكل جدول على حده
  final List<Map<int, List<Map>>> rows = [];

  // للاحتفاض بعدد الصفوف المحددة لكل جدول
  final List<Map<int, int>> selectedCount = [];

  // للاحتفاض بعدد الصفحات التي سوف يتم تقسيمها في كل جدول
  final List<Map<int, int>> rowPerPages = [];

  // للاحتفاض بعدد الصفوف في كل صفحة لكل جدول
  final List<Map<int, int>> rowPerPagesNumber = [];

  // للاحتفاض بالصفحة الحالية لكل جدول
  final List<Map<int, int>> currentTablePage = [];

  // للاحتفاض بتعداد الصفوف في كل جدول
  final List<Map<int, int>> rowsIndex = [];

  // للاحتفاض بالصفوف التي تم تحديدها في كل جدول
  final List<Map<int, Map>> rowsSelected = [];

  // للاحتفاض بنوع ترتيب الصفوف حسب الاعمدة لكل جدول
  final List<Map<int, Map<int, bool?>>> columnsSortTyep = [];

  // هل تحديد الصفوف ممكن
  final List<Map<int, bool>> isEnableSelectedColumn = [];

  // هل عمود الترقيم ضاهر
  final List<Map<int, bool>> isShowNumberingColumn = [];

  // هل البحث ممكن
  final List<Map<int, bool>> isEnableSearch = [];

  // هل تقسيم الصفحات ممكن
  final List<Map<int, bool>> isEnablePagination = [];

  // دالة تعمل لتحديد جميع الصفوف
  void selectAll({required int tableIndex}) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        for (var element in rows[i][tableIndex]!) {
          element["isSelected"] = true;
        }
        selectedCount[i][tableIndex] = rows[i][tableIndex]!.length;
      }
    }
    getRows(tableIndex: tableIndex);
    update();
  }

  // دالة لإرجاع عد الصفوف بحسب رقم الجدول
  int getRowsLength(int tableIndex) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        return rows[i][tableIndex]!.length;
      }
    }
    return 0;
  }

  // دالة لإرجاع عدد الخلايا بحسب رقم الجدول ورقم الصف
  int getCellLength(int tableIndex, int rowIndex) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        return rows[i][tableIndex]![rowIndex].length;
      }
    }
    return 0;
  }

  // دالة لإرجاع الصفوف بحسب رقم الجدول
  getRow(int tableIndex) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        return rows[i][tableIndex]!;
      }
    }
  }

  // دالة لإرجاع عدد الصفوف التي تم تحديدها حسب رقم الجدول
  int getSelectedCount(int tableIndex) {
    for (var i = 0; i < selectedCount.length; i++) {
      if (selectedCount[i].containsKey(tableIndex)) {
        return selectedCount[i][tableIndex]!;
      }
    }
    return 0;
  }

  // دالة لإرجاع عدد الصفحات في الجدول حسب رقم الجدول
  int getRowPerPages(int tableIndex) {
    for (var i = 0; i < rowPerPages.length; i++) {
      if (rowPerPages[i].containsKey(tableIndex)) {
        return rowPerPages[i][tableIndex]!;
      }
    }
    return 0;
  }

  // دالة للاحتفاض بالصفوف التي تم تحديدها حسب رقم الجدول
  void setRowsSelected(int tableIndex) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        for (var element in rows[i][tableIndex]!) {
          rowsSelected[i][tableIndex]!
              .addAll({element['id']: element['isSelected']});
        }
      }
    }
  }

  // دالة لإرجاع الصفوف التي تم تحديدها
  Map getRowsSelected(int tableIndex) {
    for (var i = 0; i < rowsSelected.length; i++) {
      if (rowsSelected[i].containsKey(tableIndex)) {
        return rowsSelected[i][tableIndex]!;
      }
    }
    return {};
  }

  // دالة لإرجاع عدد الصفوف في كل صفحة في الجدول حسب رقم الجدول
  int getRowPerPagesNumber(int tableIndex) {
    for (var i = 0; i < rowPerPagesNumber.length; i++) {
      if (rowPerPagesNumber[i].containsKey(tableIndex)) {
        return rowPerPagesNumber[i][tableIndex]!;
      }
    }
    return 0;
  }

  // دالة لإرجاع رقم الصفحة الحالية في الجدول حسب رقم الجدول
  int getCurrentTablePage(int tableIndex) {
    for (var i = 0; i < currentTablePage.length; i++) {
      if (currentTablePage[i].containsKey(tableIndex)) {
        return currentTablePage[i][tableIndex]!;
      }
    }
    return 0;
  }

  // دالة لإرجاع تعداد الصفوف حسب رقم الجدول
  int getRowsIndex(int tableIndex) {
    for (var i = 0; i < rowsIndex.length; i++) {
      if (rowsIndex[i].containsKey(tableIndex)) {
        return rowsIndex[i][tableIndex]!;
      }
    }
    return 0;
  }

  // دالة لإرجاع هل تحديد العمود ممكن
  bool getIsEnableSelectedColumn(int tableIndex) {
    for (var i = 0; i < isEnableSelectedColumn.length; i++) {
      if (isEnableSelectedColumn[i].containsKey(tableIndex)) {
        return isEnableSelectedColumn[i][tableIndex]!;
      }
    }
    return false;
  }

  // دالة لوضع قيمة هل تحديد العمود ممكن
  void setIsEnableSelectedColumn(int tableIndex, bool value) {
    for (var i = 0; i < isEnableSelectedColumn.length; i++) {
      if (isEnableSelectedColumn[i].containsKey(tableIndex)) {
        isEnableSelectedColumn[i][tableIndex] = value;
      }
    }
  }

  // دالة لإرجاع هل عمود الترقيم ضاهر
  bool getIsShowNumberingColumn(int tableIndex) {
    for (var i = 0; i < isShowNumberingColumn.length; i++) {
      if (isShowNumberingColumn[i].containsKey(tableIndex)) {
        return isShowNumberingColumn[i][tableIndex]!;
      }
    }
    return false;
  }

  // دالة لوضع قيمة هل عمود الترقيم ضاهر
  void setIsShowNumberingColumn(int tableIndex, bool value) {
    for (var i = 0; i < isShowNumberingColumn.length; i++) {
      if (isShowNumberingColumn[i].containsKey(tableIndex)) {
        isShowNumberingColumn[i][tableIndex] = value;
      }
    }
  }

  // دالة لإرجاع هل البحث ممكن
  bool getIsEnableSearch(int tableIndex) {
    for (var i = 0; i < isEnableSearch.length; i++) {
      if (isEnableSearch[i].containsKey(tableIndex)) {
        return isEnableSearch[i][tableIndex]!;
      }
    }
    return false;
  }

  // دالة لوضع قيمة هل البحث ممكن
  void setIsEnableSearch(int tableIndex, bool value) {
    for (var i = 0; i < isEnableSearch.length; i++) {
      if (isEnableSearch[i].containsKey(tableIndex)) {
        isEnableSearch[i][tableIndex] = value;
      }
    }
  }

  // دالة لإرجاع هل تقسيم الصفوف ممكن
  bool getisEnablePagination(int tableIndex) {
    for (var i = 0; i < isEnablePagination.length; i++) {
      if (isEnablePagination[i].containsKey(tableIndex)) {
        return isEnablePagination[i][tableIndex]!;
      }
    }
    return false;
  }

  // دالة لإرجاع هل تقسيم الصفوف ممكن
  void setisEnablePagination(int tableIndex, bool value) {
    for (var i = 0; i < isEnablePagination.length; i++) {
      if (isEnablePagination[i].containsKey(tableIndex)) {
        isEnablePagination[i][tableIndex] = value;
      }
    }
  }

  // دالة لحساب عدد الصفحات في الجدول وتعداد الصفوف في كل صفحة حسب رقم الجدول
  void getRows({required int tableIndex}) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        rowPerPages[i][tableIndex] =
            (rows[i][tableIndex]!.length ~/ rowPerPagesNumber[i][tableIndex]!)
                .toInt();
        if ((rowPerPages[i][tableIndex]! * rowPerPagesNumber[i][tableIndex]!) <
            rows[i][tableIndex]!.length) {
          rowPerPages[i][tableIndex] = rowPerPages[i][tableIndex]! + 1;
        }
        rowsIndex[i][tableIndex] = (currentTablePage[i][tableIndex]! - 1) *
            rowPerPagesNumber[i][tableIndex]!;
      }
    }
  }

  // دالة تعمل عند التنقل بين الصفحات في الجدول
  // لتغيير رقم الصفحة الحالية في الجدول
  void pageChange(int number, int tableIndex) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        if (number >= 0 && number <= rowPerPages[i][tableIndex]!) {
          currentTablePage[i][tableIndex] = number;
        }
      }
    }
    update();
  }

  // دالة لحساب عدد الصفوف التي تم تحديدها حسب رقم الجدول
  void selectedCounts({required int tableIndex}) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        selectedCount[i][tableIndex] = 0;
        for (var element in rows[i][tableIndex]!) {
          if (element["isSelected"]) {
            selectedCount[i][tableIndex] = selectedCount[i][tableIndex]! + 1;
          }
        }
      }
    }
  }

  // دالة لإضافة بيئة وبيانات جدول جديد
  void addTable({
    required int tableIndex,
    required Map<int, List<Map>> listRows,
    required Map<int, int> selectedCount,
    required Map<int, int> rowPerPages,
    required Map<int, int> rowPerPagesNumber,
    required Map<int, int> currentTablePage,
    required Map<int, int> rowsIndex,
    required Map<int, Map> rowsSelected,
    required Map<int, Map<int, bool?>> columnsSortTyep,
    required Map<int, bool> isEnableSelectedColumn,
    required Map<int, bool> isShowNumberingColumn,
    required Map<int, bool> isEnableSearch,
    required Map<int, bool> isEnablePagination,
  }) {
    if (rows.isEmpty) {
      rows.addAll([listRows]);
      this.selectedCount.addAll([selectedCount]);
      this.rowPerPages.addAll([rowPerPages]);
      this.rowPerPagesNumber.addAll([rowPerPagesNumber]);
      this.currentTablePage.addAll([currentTablePage]);
      this.rowsIndex.addAll([rowsIndex]);
      this.rowsSelected.addAll([rowsSelected]);
      this.columnsSortTyep.addAll([columnsSortTyep]);
      this.isEnableSelectedColumn.addAll([isEnableSelectedColumn]);
      this.isShowNumberingColumn.addAll([isShowNumberingColumn]);
      this.isEnableSearch.addAll([isEnableSearch]);
      this.isEnablePagination.addAll([isEnablePagination]);
    } else {
      for (var i = 0; i < rows.length; i++) {
        if (!rows[i].containsKey(tableIndex)) {
          rows.addAll([listRows]);
          this.selectedCount.addAll([selectedCount]);
          this.rowPerPages.addAll([rowPerPages]);
          this.rowPerPagesNumber.addAll([rowPerPagesNumber]);
          this.currentTablePage.addAll([currentTablePage]);
          this.rowsIndex.addAll([rowsIndex]);
          this.rowsSelected.addAll([rowsSelected]);
          this.columnsSortTyep.addAll([columnsSortTyep]);
          this.isEnableSelectedColumn.addAll([isEnableSelectedColumn]);
          this.isShowNumberingColumn.addAll([isShowNumberingColumn]);
          this.isEnableSearch.addAll([isEnableSearch]);
          this.isEnablePagination.addAll([isEnablePagination]);
        }
      }
    }
  }

  // دالة لفحص الصفوف حسب رقم الجدول وارجاع اذا تم تحديد جميع الصفوف او لا
  bool checkTheList({required int tableIndex}) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        if (rows[i][tableIndex]!.isEmpty) {
          return false;
        } else {
          return rows[i][tableIndex]!.every(
            (element) => element["isSelected"] == true,
          );
        }
      }
    }
    return false;
  }

  // دالة لإلغاء تحديد جميع الصفوف حسب رقم الجدول
  void deselectAll({required int tableIndex}) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        for (var element in rows[i][tableIndex]!) {
          element["isSelected"] = false;
        }
        selectedCount[i][tableIndex] = 0;
      }
    }
    getRows(tableIndex: tableIndex);
    update();
  }

  // دالة لتحديد وإلغاء تحديد الصفوف الفردية حسب رقم الجدول ورقم الصف
  void selectRow({required int tableIndex, required int index}) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        rows[i][tableIndex]![index]["isSelected"] =
            !rows[i][tableIndex]![index]["isSelected"];
      }
    }
    selectedCounts(tableIndex: tableIndex);
    getRows(tableIndex: tableIndex);
    update();
  }

  // دالة لإرجاع نوع ترتيب الصفوف حسب رقم الجدول
  bool? getColumnsSortTyep(int tableIndex, int columnIndex) {
    for (var i = 0; i < columnsSortTyep.length; i++) {
      if (columnsSortTyep[i].containsKey(tableIndex)) {
        return columnsSortTyep[i][tableIndex]![columnIndex];
      }
    }
    return null;
  }

  // دالة لتغيير حالة ترتيب الصفوف
  void changeColumnsSortTyep(int tableIndex, int columnIndex) {
    for (var i = 0; i < columnsSortTyep.length; i++) {
      if (columnsSortTyep[i].containsKey(tableIndex)) {
        if (columnsSortTyep[i][tableIndex]![columnIndex] == null) {
          reSetSortColumns(tableIndex, i);
          columnsSortTyep[i][tableIndex]![columnIndex] = true;
        } else if (columnsSortTyep[i][tableIndex]![columnIndex] == true) {
          reSetSortColumns(tableIndex, i);
          columnsSortTyep[i][tableIndex]![columnIndex] = false;
        } else {
          reSetSortColumns(tableIndex, i);
          columnsSortTyep[i][tableIndex]![columnIndex] = true;
        }
      }
    }
  }

  // دالة إعادة ضبط الترتيب
  void reSetSortColumns(int tableIndex, int? i) {
    if (i != null) {
      if (columnsSortTyep[i].containsKey(tableIndex)) {
        columnsSortTyep[i][tableIndex]!.forEach((key, value) {
          columnsSortTyep[i][tableIndex]![key] = null;
        });
      }
    } else {
      for (var i = 0; i < columnsSortTyep.length; i++) {
        if (columnsSortTyep[i].containsKey(tableIndex)) {
          columnsSortTyep[i][tableIndex]!.forEach((key, value) {
            columnsSortTyep[i][tableIndex]![key] = null;
          });
        }
      }
    }
  }

  // دالة ترتيب الصفوف حسب الاعمدة
  void sortByColumn({
    required int tableIndex,
    required String cellsKey,
    required int columnIndex,
  }) {
    for (var i = 0; i < rows.length; i++) {
      if (rows[i].containsKey(tableIndex)) {
        changeColumnsSortTyep(tableIndex, columnIndex);
        rows[i][tableIndex]!.sort(
          (a, b) {
            if (getColumnsSortTyep(tableIndex, columnIndex) == null) {
              return a[cellsKey].text.compareTo(b[cellsKey].text);
            } else if (getColumnsSortTyep(tableIndex, columnIndex)!) {
              return b[cellsKey].text.compareTo(a[cellsKey].text);
            } else {
              return a[cellsKey].text.compareTo(b[cellsKey].text);
            }
          },
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    rows.clear();
    selectedCount.clear();
    rowPerPages.clear();
    rowPerPagesNumber.clear();
    rowsIndex.clear();
    currentTablePage.clear();
    rowsSelected.clear();
    super.onInit();
  }
}
