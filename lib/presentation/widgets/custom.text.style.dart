import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.fonts.dart';

class CustomTextWidget {
  static bodyTextB1({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
    );
  }

  static bodyTextB2({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 20.0,
    );
  }

  static bodyTextB3({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 16.0,
    );
  }

  static bodyTextB4({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontWeight: FontWeight.w900,
      fontSize: 14.0,
    );
  }

  static bodyText1({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontSize: 18.0,
    );
  }

  static bodyText2({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontSize: 16.0,
    );
  }

  static bodyText3({required Color color}) {
    return TextStyle(
      fontFamily: AppFonts.contax,
      color: color,
      fontSize: 14.0,
    );
  }
}
