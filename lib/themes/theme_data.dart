import 'package:expense_tracker/themes/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData trackerTheme = ThemeData(
        colorSchemeSeed: appPrimaryColor,
        textTheme: GoogleFonts.latoTextTheme())
    .copyWith(
  appBarTheme: AppBarTheme(
      backgroundColor: appPrimaryColor,
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle:
          GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold)),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: appPrimaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
    ),
  ),
);
