import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/notifiers/size.notifier.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';

Widget selectSize({required bool themeFlag, required BuildContext context}) {
  SizeNotifier sizeNotifier(bool renderUI) =>
      Provider.of<SizeNotifier>(context, listen: renderUI);
  return ListView(scrollDirection: Axis.horizontal, children: [
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeEight();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 80,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "US 8",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeEight
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeNine();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 80,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "US 9",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeNine
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeTen();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 80,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "US 10",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeTen
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        sizeNotifier(false).selectSizeEleven();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: 80,
          height: 40,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "US 11",
                style: CustomTextWidget.bodyText2(
                  color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: sizeNotifier(true).sizeEleven
                  ? AppColors.rawSienna
                  : themeFlag
                      ? AppColors.creamColor
                      : AppColors.mirage,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
  ]);
}
