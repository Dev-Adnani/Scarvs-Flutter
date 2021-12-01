import 'package:flutter/material.dart';

import 'package:scarvs/app/constants/app.colors.dart';

class CustomBackButton extends StatelessWidget {
  final String route;
  final bool themeFlag;
  const CustomBackButton({
    Key? key,
    required this.route,
    required this.themeFlag,
  }) : super(key: key);
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

class CustomBackPop extends StatelessWidget {
  final bool themeFlag;
  const CustomBackPop({
    Key? key,
    required this.themeFlag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: themeFlag ? AppColors.creamColor : AppColors.mirage,
      ),
    );
  }
}
