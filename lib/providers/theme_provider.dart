import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isLightTheme;

  ThemeProvider({this.isLightTheme = true});

  ThemeData get getThemeData => isLightTheme ? lightTheme : darkTheme;

  setThemeData(bool val) {
    if (val) {
      isLightTheme = true;
    } else {
      isLightTheme = false;
    }
    notifyListeners();
  }

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Color(0xFF000000),
  );
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xFFE5E5E5),
  );
}
