import 'package:flutter/material.dart';

class Themes {
  static ThemeData getTheme(int colorNumber, bool isDark) {
    return ThemeData(
      colorScheme: ColorScheme(
        error: Color.fromARGB(255, 255, 0, 0),
        onError: isDark
            ? Color.fromARGB(255, 153, 28, 28)
            : Color.fromARGB(255, 183, 28, 28),
        onErrorContainer: isDark ? Colors.red[900] : Colors.red[700],
        // اللون الاساسي
        primary: (colorNumber == 1)
            ? const Color(0xffe55252)
            : (colorNumber == 2)
                ? const Color(0xff526ae5)
                : (colorNumber == 3)
                    ? const Color(0xffe5aa52)
                    : (colorNumber == 4)
                        ? const Color(0xffad52e5)
                        : const Color(0xff52e5be),
        // لون رصاصي كلون فرعي
        onPrimary: isDark ? const Color(0xFF999999) : const Color(0xFF666666),
        // لون الخلفية
        background: colorNumber == 1
            ? isDark
                ? const Color(0xff3d2828)
                : const Color(0xFFfcf3f3)
            : colorNumber == 2
                ? isDark
                    ? const Color(0xff27293b)
                    : const Color(0xFFf3f4fc)
                : colorNumber == 3
                    ? isDark
                        ? const Color(0xff382d20)
                        : const Color(0xFFfcf8f3)
                    : colorNumber == 4
                        ? isDark
                            ? const Color(0xff31263b)
                            : const Color(0xFFf8f3fc)
                        : isDark
                            ? const Color(0xff253531)
                            : const Color(0xFFf3fcfa),
        // لون الظل
        shadow: isDark
            ? const Color.fromARGB(127, 0, 0, 0)
            : const Color.fromARGB(127, 150, 150, 150),
        // نوع الإضائة
        brightness: isDark ? Brightness.dark : Brightness.light,
        surface: Color(0xff111111),
        onSurface: (colorNumber == 1 || colorNumber == 3 || colorNumber == 5)
            ? Color(0xff111111)
            : Colors.white,
        // الالوان الفرعية 1
        secondary: (colorNumber == 1)
            ? const Color.fromARGB(51, 255, 0, 0)
            : (colorNumber == 2)
                ? const Color.fromARGB(51, 0, 42, 255)
                : (colorNumber == 3)
                    ? const Color.fromARGB(51, 255, 115, 0)
                    : (colorNumber == 4)
                        ? const Color.fromARGB(51, 157, 0, 255)
                        : const Color.fromARGB(51, 0, 255, 187),
        secondaryContainer: (colorNumber == 1)
              ? Color.fromARGB(155, 162, 42, 42)
              : (colorNumber == 2)
                  ? const Color.fromARGB(155, 42, 42, 162)
                  : (colorNumber == 3)
                      ? const Color.fromARGB(155, 162, 157, 42)
                      : (colorNumber == 4)
                          ? const Color.fromARGB(155, 157, 42, 162)
                          : const Color.fromARGB(155, 42, 162, 145),
        // الالوان الفرعية 2
        onSecondary: (colorNumber == 1)
            ? const Color.fromARGB(51, 0, 42, 255)
            : (colorNumber == 2)
                ? const Color.fromARGB(51, 255, 115, 0)
                : (colorNumber == 3)
                    ? const Color.fromARGB(51, 0, 42, 255)
                    : (colorNumber == 4)
                        ? const Color.fromARGB(51, 255, 153, 0)
                        : const Color.fromARGB(51, 255, 0, 0),
        onBackground: isDark ? Color(0xff454554) : Color(0xFFD3D3D3),
        primaryContainer: (colorNumber == 1)
            ? const Color(0xffff6666)
            : (colorNumber == 2)
                ? const Color(0xff667fff)
                : (colorNumber == 3)
                    ? const Color(0xffffc266)
                    : (colorNumber == 4)
                        ? const Color(0xffc466ff)
                        : const Color(0xff66ffd6),
        onPrimaryContainer: (colorNumber == 1)
            ? const Color(0xff667fff)
            : (colorNumber == 2)
                ? const Color(0xffffab66)
                : (colorNumber == 3)
                    ? const Color(0xff667fff)
                    : (colorNumber == 4)
                        ? const Color(0xffffc266)
                        : const Color(0xffff6666),
      ),
      primaryColorDark: isDark ? Color(0xff111111) : Colors.white,
      primaryColorLight: isDark ? Colors.white : Color(0xff111111),
      iconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      dividerColor: isDark ? const Color(0xFF999999) : const Color(0xFF666666),
      cardTheme: CardTheme(
        color: isDark ? Color(0xff111111) : Colors.white,
        elevation: 10,
        shadowColor: isDark
            ? const Color.fromARGB(127, 0, 0, 0)
            : const Color.fromARGB(127, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isDark ? Color(0xff454554) : Color(0xFFD3D3D3),
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      datePickerTheme: DatePickerThemeData(        
        backgroundColor: isDark ? Color(0xff111111) : Colors.white,
        dayForegroundColor: MaterialStateProperty.all(
          isDark ? Colors.white : Color(0xff111111),
        ),
        dayOverlayColor: MaterialStateProperty.all(
          (colorNumber == 1)
              ? const Color.fromARGB(51, 255, 0, 0)
              : (colorNumber == 2)
                  ? const Color.fromARGB(51, 0, 42, 255)
                  : (colorNumber == 3)
                      ? const Color.fromARGB(51, 255, 115, 0)
                      : (colorNumber == 4)
                          ? const Color.fromARGB(51, 157, 0, 255)
                          : const Color.fromARGB(51, 0, 255, 187),
        ),
        dividerColor:
            isDark ? const Color(0xFF999999) : const Color(0xFF666666),
        elevation: 10,
        headerBackgroundColor: (colorNumber == 1)
            ? const Color(0xffe55252)
            : (colorNumber == 2)
                ? const Color(0xff526ae5)
                : (colorNumber == 3)
                    ? const Color(0xffe5aa52)
                    : (colorNumber == 4)
                        ? const Color(0xffad52e5)
                        : const Color(0xff52e5be),
        headerForegroundColor:
            (colorNumber == 1 || colorNumber == 3 || colorNumber == 5)
                ? Color(0xff111111)
                : Colors.white,
        shadowColor: isDark
            ? const Color.fromARGB(127, 0, 0, 0)
            : const Color.fromARGB(127, 255, 255, 255),
        todayBackgroundColor: MaterialStateProperty.all(
          isDark ? Color(0xff111111) : Colors.white,
        ),
        todayBorder: BorderSide(
          color: (colorNumber == 1)
                ? const Color(0xffe55252)
                : (colorNumber == 2)
                    ? const Color(0xff526ae5)
                    : (colorNumber == 3)
                        ? const Color(0xffe5aa52)
                        : (colorNumber == 4)
                            ? const Color(0xffad52e5)
                            : const Color(0xff52e5be),
                            width: 2,
        ),
        todayForegroundColor: MaterialStateProperty.all(
          (colorNumber == 1)
                ? const Color(0xffe55252)
                : (colorNumber == 2)
                    ? const Color(0xff526ae5)
                    : (colorNumber == 3)
                        ? const Color(0xffe5aa52)
                        : (colorNumber == 4)
                            ? const Color(0xffad52e5)
                            : const Color(0xff52e5be),
        ),
        weekdayStyle: TextStyle(
          color: isDark ? const Color(0xFF999999) : const Color(0xFF666666),
        ),
        yearBackgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        yearForegroundColor: MaterialStateProperty.all(
          isDark ? Colors.white : Color(0xff111111),
        ),
        yearOverlayColor: MaterialStateProperty.all(
          (colorNumber == 1)
              ? const Color.fromARGB(51, 255, 0, 0)
              : (colorNumber == 2)
                  ? const Color.fromARGB(51, 0, 42, 255)
                  : (colorNumber == 3)
                      ? const Color.fromARGB(51, 255, 115, 0)
                      : (colorNumber == 4)
                          ? Color.fromRGBO(157, 0, 255, 0.2)
                          : const Color.fromARGB(51, 0, 255, 187),
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: isDark ? Color(0xff111111) : Colors.white,
        dayPeriodTextColor: isDark ? Colors.white : Color(0xff111111),
        dialBackgroundColor: colorNumber == 1
              ? isDark
                  ? const Color(0xff3d2828)
                  : const Color(0xFFfcf3f3)
              : colorNumber == 2
                  ? isDark
                      ? const Color(0xff27293b)
                      : const Color(0xFFf3f4fc)
                  : colorNumber == 3
                      ? isDark
                          ? const Color(0xff382d20)
                          : const Color(0xFFfcf8f3)
                      : colorNumber == 4
                          ? isDark
                              ? const Color(0xff31263b)
                              : const Color(0xFFf8f3fc)
                          : isDark
                              ? const Color(0xff253531)
                              : const Color(0xFFf3fcfa),
        dialTextColor: isDark ? Colors.white : Color(0xff111111),
        elevation: 10,
        entryModeIconColor: isDark ? Colors.white : Color(0xff111111),
        hourMinuteTextColor: isDark ? Colors.white : Color(0xff111111),
      )
    );
  }
}
