import 'package:boiler_plate/utils/colors.dart';
import 'package:flutter/material.dart';

import 'app_sizes.dart';

class AppThemes {
  AppThemes._();

  //main color
  static const Color _lightPrimaryColor = kDodgerBlue;

  //Background Colors
  static const Color _lightBackgroundColor = kWhiteLilac;
  static const Color _lightBackgroundAppBarColor = _lightPrimaryColor;
  static const Color _lightBackgroundSecondaryColor = kWhite;
  static const Color _lightBackgroundAlertColor = kBlackPearl;
  static const Color _lightBackgroundActionTextColor = kWhite;
  static const Color _lightBackgroundErrorColor = kBrinkPink;
  static const Color _lightBackgroundSuccessColor = kJuneBud;

  //Text Colors
  static const Color _lightTextColor = kBlack;
  static const Color _lightAlertTextColor = kBlack;
  static const Color _lightTextSecondaryColor = kBlack;

  //Border Color
  static const Color _lightBorderColor = kNevada;

  //Icon Color
  static const Color _lightIconColor = kNevada;

  //form input colors
  static const Color _lightInputFillColor = _lightBackgroundSecondaryColor;
  static const Color _lightBorderActiveColor = _lightPrimaryColor;
  static const Color _lightBorderErrorColor = kBrinkPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = kDodgerBlue;

  //Background Colors
  static const Color _darkBackgroundColor = kEbonyClay;
  static const Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
      Color.fromRGBO(0, 0, 0, .6);
  static const Color _darkBackgroundAlertColor = kBlackPearl;
  static const Color _darkBackgroundActionTextColor = kWhite;

  static const Color _darkBackgroundErrorColor =
      Color.fromRGBO(255, 97, 136, 1);
  static const Color _darkBackgroundSuccessColor =
      Color.fromRGBO(186, 215, 97, 1);

  //Text Colors
  static const Color _darkTextColor = kWhite;
  static const Color _darkAlertTextColor = kBlack;
  static const Color _darkTextSecondaryColor = kBlack;

  //Border Color
  static const Color _darkBorderColor = kNevada;

  //Icon Color
  static const Color _darkIconColor = kNevada;

  static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  static const Color _darkBorderErrorColor = kBrinkPink;

  //text theme for light theme
  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: AppSizes.p20, color: _lightTextColor),
    bodyLarge: TextStyle(fontSize: AppSizes.p16, color: _lightTextColor),
    bodyMedium: TextStyle(fontSize: AppSizes.p14, color: kGrey),
    labelLarge: TextStyle(
      fontSize: AppSizes.p14,
      color: _lightTextColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(fontSize: AppSizes.p16, color: _lightTextColor),
    titleMedium: TextStyle(fontSize: AppSizes.p16, color: _lightTextColor),
    bodySmall:
        TextStyle(fontSize: AppSizes.p12, color: _lightBackgroundAppBarColor),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _lightTextColor),
      toolbarTextStyle: _lightTextTheme.bodyMedium,
      titleTextStyle: _lightTextTheme.titleLarge,
    ),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: _lightBackgroundAlertColor,
      actionTextColor: _lightBackgroundActionTextColor,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme:
        const PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      buttonColor: _lightPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: _lightIconColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      fillColor: _lightBackgroundSecondaryColor,
      //focusColor: _lightBorderActiveColor,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: AppSizes.p20, color: _darkTextColor),
    bodyLarge: TextStyle(fontSize: AppSizes.p16, color: _darkTextColor),
    bodyMedium: TextStyle(fontSize: AppSizes.p14, color: kGrey),
    labelLarge: TextStyle(
      fontSize: AppSizes.p14,
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(fontSize: AppSizes.p16, color: _darkTextColor),
    titleMedium: TextStyle(fontSize: AppSizes.p16, color: _darkTextColor),
    bodySmall:
        TextStyle(fontSize: AppSizes.p12, color: _darkBackgroundAppBarColor),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark, //prefix icon color form input on focus

    scaffoldBackgroundColor: _darkBackgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _darkBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _darkTextColor),
      toolbarTextStyle: _darkTextTheme.bodyMedium,
      titleTextStyle: _darkTextTheme.titleLarge,
    ),
    snackBarTheme: const SnackBarThemeData(
      contentTextStyle: TextStyle(color: kWhite),
      backgroundColor: _darkBackgroundAlertColor,
      actionTextColor: _darkBackgroundActionTextColor,
    ),
    iconTheme: const IconThemeData(
      color: _darkIconColor, //_darkIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.p8),
      ),
      buttonColor: _darkPrimaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: TextStyle(color: _darkIconColor),
      //labelStyle: TextStyle(color: nevada),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.p8),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.p8)),
      ),
      fillColor: _darkInputFillColor,
      //focusColor: _darkBorderActiveColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _darkPrimaryColor,

      // secondary: _darkSecondaryColor,
    ).copyWith(secondary: _darkPrimaryColor),
  );
}
