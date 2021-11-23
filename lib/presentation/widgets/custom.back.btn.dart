import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';

class CustomBackButton extends StatelessWidget {
  final String route;
  final bool themeFlag;
  const CustomBackButton({required this.route, required this.themeFlag});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: themeFlag ? AppColors.creamColor : AppColors.mirage,
      ),
    );
  }
}
