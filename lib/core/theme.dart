import 'package:flutter/material.dart';

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

    textTheme: const TextTheme(

      titleMedium: TextStyle(
        color: Colors.black87,
        fontSize: 18,
        fontWeight: FontWeight.w300,
      ),

      bodySmall: TextStyle(
        color: Colors.redAccent,
        fontSize: 10,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white60,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.black45,
    ),
  );
}
