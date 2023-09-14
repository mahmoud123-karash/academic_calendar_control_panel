import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/jHijri.dart';

Color myColor = const Color(0xFF046E8F);
Color blackColor = const Color(0xFF16262E);

String textFamily = 'Ruwudu';

var dayname = JHijri.now().dayName.toString();
var day = JHijri.now().day.toString();
var mounth = JHijri.now().monthName.toString();
var year = JHijri.now().year.toString();
DateTime now = DateTime.now();
String formattedDate = DateFormat.yMMMEd().format(now);

String date = '$formattedDate   /  $day $mounth $year';
String datej = " $day $mounth $year";
String dateM = formattedDate;
