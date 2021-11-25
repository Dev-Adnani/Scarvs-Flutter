import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.fonts.dart';

class SnackUtil {
  static stylishSnackBar(
      {required String text, required BuildContext context}) {
    return SnackBar(
      backgroundColor: AppColors.rawSienna,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.fromLTRB(40, 0, 40, 100),
      content: Text(
        text,
        style: TextStyle(
          color: AppColors.creamColor,
          fontFamily: AppFonts.contax,
        ),
      ),
    );
  }
}
