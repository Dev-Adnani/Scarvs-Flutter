import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/constants/app.keys.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<ThemeNotifier>(builder: (context, notifier, _) {
              return MaterialButton(
                color: AppColors.rawSienna,
                onPressed: () {
                  notifier.toggleTheme();
                },
                child: Text('Theme'),
              );
            }),
            MaterialButton(
              color: AppColors.rawSienna,
              onPressed: () {
                DeleteCache.deleteKey(AppKeys.userData).whenComplete(
                  () => {
                    DeleteCache.deleteKey(AppKeys.onBoardDone),
                    Navigator.of(context)
                        .pushReplacementNamed(AppRouter.loginRoute)
                  },
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
