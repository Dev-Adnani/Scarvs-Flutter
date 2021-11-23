import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.fonts.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

Widget welcomeTextSignup({required bool themeFlag}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      vSizedBox4,
      vSizedBox1,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            text: 'Hey There 😲',
            style: TextStyle(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              fontWeight: FontWeight.w900,
              fontFamily: AppFonts.contax,
              fontSize: 35.0,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Welcome To ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontFamily: AppFonts.contax,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: 'Scarvs ! 🛒  ',
                    style: TextStyle(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontFamily: AppFonts.contax,
                      fontSize: 28.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
      Padding(
        padding: const EdgeInsets.fromLTRB(35.0, 0.0, 35.0, 2.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: "Signup ",
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                  TextSpan(
                    text: "& Buy Shoes At Rock Bottom Prices",
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      vSizedBox2,
    ],
  );
}
