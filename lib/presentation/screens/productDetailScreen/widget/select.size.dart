import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';

Widget selectSize({required int size, required bool themeFlag}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      width: 80,
      height: 40,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "US $size",
            style: CustomTextWidget.bodyText2(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
