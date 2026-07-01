import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static String get appName => 'Health Care';

  static Brightness get isDark => Brightness.dark;

  static ThemeData get light => ThemeData(
    brightness: .light,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    textTheme: GoogleFonts.poppinsTextTheme(),
    colorScheme: ColorScheme.light(
      background: Colors.white,
      brightness: .light,
      primary: Colors.white
    ),
    iconTheme: IconThemeData(color: Colors.black),
    appBarTheme: AppBarTheme(elevation:10,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black
    )
  );

  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,

    textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
    colorScheme: ColorScheme.dark(
      primary:  Colors.black,
      surface:  Colors.black,
      brightness: .dark,
      background: Colors.black,
    ),

    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
      elevation: 10,
      backgroundColor: Color(0xFF333945),
      foregroundColor: Colors.white,
    ),
  );
}
