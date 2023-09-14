// ignore_for_file: prefer_const_constructors, duplicate_ignore, unused_import

import 'dart:ui';

import 'package:academic_calendar/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightmode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: myColor),
  primaryColor: myColor,
  useMaterial3: true,
  listTileTheme: ListTileThemeData(
    iconColor: Colors.black,
    textColor: Colors.black,
  ),
  iconTheme: IconThemeData(color: Colors.black),
  drawerTheme: DrawerThemeData(backgroundColor: Colors.white, elevation: 0.0),
  primarySwatch: Colors.green,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
        color: Colors.black,
        fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')]),
    bodyLarge: TextStyle(
        color: Colors.black,
        fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')]),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: myColor, fontSize: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black, statusBarIconBrightness: Brightness.dark),
    elevation: 0,
    actionsIconTheme: IconThemeData(color: Colors.black, size: 30),
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: myColor,
    fillColor: Colors.black,
    prefixIconColor: myColor,
    suffixIconColor: myColor,
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
  ),
);

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: myColor),
  primaryColor: myColor,
  useMaterial3: true,
  dialogBackgroundColor: darkbackground,
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white60,
    textColor: Colors.white60,
  ),
  iconTheme: IconThemeData(color: Colors.white60),
  drawerTheme: DrawerThemeData(
    backgroundColor: darkbackground,
  ),
  primarySwatch: Colors.green,
  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontFeatures: const <FontFeature>[FontFeature.enable('aaaa')],
    ),
  ),
  scaffoldBackgroundColor: darkbackground,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: myColor),
    backgroundColor: darkbackground,
    titleTextStyle: TextStyle(color: myColor, fontSize: 25),
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: darkbackground,
        statusBarIconBrightness: Brightness.dark),
    elevation: 0,
    actionsIconTheme: IconThemeData(color: myColor, size: 30),
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: myColor,
    fillColor: Colors.white,
    prefixIconColor: myColor,
    suffixIconColor: myColor,
    labelStyle: TextStyle(
      color: Colors.white,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: myColor),
    ),
  ),
);

Color darkbackground = Color(0xFF16262E);
