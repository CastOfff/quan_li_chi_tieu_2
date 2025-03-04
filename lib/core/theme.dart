import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,

    appBarTheme: const AppBarTheme(
      shadowColor: Colors.black,
      elevation: 5,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Color(0xfff8eff8),
    ),

    textTheme: TextTheme(

      titleMedium: TextStyle(
        color: Colors.black87,
        fontSize: 16.w,
        fontWeight: FontWeight.w400,
      ),

      bodySmall: TextStyle(
        color: Colors.redAccent,
        fontSize: 10.0,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white60,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black45,
    ),
  );
}
