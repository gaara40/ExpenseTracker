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
  cardTheme: CardTheme(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    color: Colors.white,
    elevation: 5,
    shadowColor: Colors.black.withValues(alpha: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
);
