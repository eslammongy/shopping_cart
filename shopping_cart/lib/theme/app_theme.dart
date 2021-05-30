import 'package:flutter/material.dart';

enum AppTheme {
  DefultLight,
  BlueLight,
  OrangeDark,
}

final appThemeData = {
  AppTheme.DefultLight: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white),
  AppTheme.BlueLight: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blueAccent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.black,
        ),
      ),
      scaffoldBackgroundColor: Colors.white),
  AppTheme.OrangeDark: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepOrange,
      scaffoldBackgroundColor: Color(0xff1D1F1F)),
};
