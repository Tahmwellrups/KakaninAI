import 'package:flutter/material.dart';
import 'package:kakaninai/consts/app_colors.dart';

class Styles {
  static ThemeData themeData({required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      scaffoldBackgroundColor: isDarkTheme ? AppColors.darkScaffoldColor : AppColors.lightScaffoldColor,
      indicatorColor: isDarkTheme ? Colors.white : Colors.black,
      hintColor: isDarkTheme ? Colors.white : Colors.black,
      highlightColor: isDarkTheme ? Colors.grey : AppColors.customOrange,
      hoverColor: isDarkTheme ? Colors.grey : AppColors.customOrange,
      focusColor: isDarkTheme ? Colors.grey : AppColors.customOrange,
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: isDarkTheme ? Colors.white : Colors.black,
      ),
      cardColor: isDarkTheme ? Colors.black : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        buttonColor: isDarkTheme ? AppColors.customOrange : AppColors.customOrange,
      ),
    );
  }
}