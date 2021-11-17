import 'dart:async';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/app/constants/app.fonts.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _initiateCache() async {
    return CacheManagerUtils.conditionalCache(
      key: AppKeys.onBoardDone,
      valueType: ValueType.StringValue,
      actionIfNull: () {
        Navigator.of(context).pushNamed(AppRouter.onBoardRoute).whenComplete(
            () => {
                  WriteCache.setString(
                      key: AppKeys.onBoardDone, value: 'Something')
                });
      },
      actionIfNotNull: () {
        CacheManagerUtils.conditionalCache(
            key: AppKeys.userData,
            valueType: ValueType.StringValue,
            actionIfNull: () {
              Navigator.of(context).pushNamed(AppRouter.loginRoute);
            },
            actionIfNotNull: () {
              Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
            });
      },
    );
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), _initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Scarvs',
              style: TextStyle(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                fontFamily: AppFonts.contax,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
