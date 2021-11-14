import 'dart:async';

import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/app/routes/app.routes.dart';

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
        Navigator.of(context).pushNamed(AppRouter.loginRoute);
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
    return Scaffold(
      backgroundColor: AppColors.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Scarvs',
              style: TextStyle(
                color: AppColors.mirage,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
