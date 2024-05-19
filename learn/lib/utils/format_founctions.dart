import 'package:intl/intl.dart';

class FormatFounctions {
  static String getStringFromDate({
    DateTime? date,
  }) {
    DateFormat format;
    if (date != null) {
      format = DateFormat("yyyy/MM/dd");
      return format.format(date);
    } else {
      return "";
    }
  }

  static DateTime? getDateFromString({
    String? string,
  }) {
    DateFormat format;
    if (string!.isNotEmpty) {
      format = DateFormat('yyyy/MM/dd');
      return format.parse(string);
    } else {
      return null;
    }
  }
}