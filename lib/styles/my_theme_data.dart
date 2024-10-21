import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/app_colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.blackishColor,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.blackishColor,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: AppColors.blackishColor,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.blackishColor,
      ),
    ),
    scaffoldBackgroundColor: AppColors.bgLightColor,
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: CircularNotchedRectangle(),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.grayColor,
        showUnselectedLabels: false),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      shape: StadiumBorder(
          side: BorderSide(
        color: AppColors.whiteColor,
        width: 4,
      )),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: false,
  );

  static ThemeData darkTheme = ThemeData(
    // brightness: Brightness.dark,
    textTheme: const TextTheme(
        titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    )),
    scaffoldBackgroundColor: AppColors.bgDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Color(0xFFC8C9CB),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    useMaterial3: false,
  );
}
