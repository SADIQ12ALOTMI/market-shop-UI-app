import 'package:flutter/material.dart';

import 'constants.dart';
ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    visualDensity: VisualDensity.adaptivePlatformDensity,

    inputDecorationTheme: inputDecorationTheme(),
    primarySwatch: Colors.blue,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder=OutlineInputBorder(

    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(

    contentPadding: EdgeInsets.symmetric(horizontal: 42,vertical: 20),


    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder

  );
}



AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),


      textTheme: TextTheme(
          headline6: TextStyle(color: Color(0xFF888888), fontSize: 18)));
}