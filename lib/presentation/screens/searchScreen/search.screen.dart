import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<ThemeNotifier>(builder: (context, notifier, _) {
          return MaterialButton(
            color: AppColors.rawSienna,
            onPressed: () {
              notifier.toggleTheme();
            },
            child: Text('Why'),
          );
        }),
      ),
    );
  }
}
