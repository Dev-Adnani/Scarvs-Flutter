import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.fonts.dart';
import 'app.colors.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.creamColor,
    brightness: Brightness.dark,
    background: AppColors.mirage,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.white54,
  fontFamily: AppFonts.contax,
);

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.mirage,
    brightness: Brightness.light,
    background: AppColors.creamColor,
  ),
  indicatorColor: AppColors.rawSienna,
  dividerColor: Colors.black,
  fontFamily: AppFonts.contax,
);
