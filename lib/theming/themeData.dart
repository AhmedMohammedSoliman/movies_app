import 'package:flutter/material.dart';

class ThemingData {
  static const Color primaryColor = Colors.yellow ;

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black ,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor ,
      unselectedItemColor: Colors.white ,
      selectedLabelStyle: TextStyle(color: Colors.yellow),
      unselectedLabelStyle: TextStyle(color: Colors.white),
    )
  );
  }