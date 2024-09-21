import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    displayLarge: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.white, fontSize: 16),
    titleSmall: TextStyle(color: Colors.white, fontSize: 14),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white),
    labelStyle: TextStyle(color: Colors.white),
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    ),
    
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    
      // borderSide: BorderSide(color: Colors.white, width: 2.0),
      
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,

      // borderSide: BorderSide(color: Colors.white, width: 1.0),
    ),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    textTheme: ButtonTextTheme.primary,
  ),
  textSelectionTheme: TextSelectionThemeData(selectionHandleColor: Colors.white,
  cursorColor: Colors.white,
  selectionColor: Colors.white),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange,
  ),
  cardColor: Colors.white,
  hoverColor: Colors.white.withOpacity(0.2),
  splashColor: Colors.white.withOpacity(0.4),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    // foregroundColor: Colors.black,
    elevation: 0,
  ),
);
