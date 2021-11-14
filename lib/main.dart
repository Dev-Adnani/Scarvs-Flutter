import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.theme.dart';
import 'package:scarvs/app/providers/app.provider.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider.providers,
      child: const Lava(),
    );
  }
}

class Lava extends StatelessWidget {
  const Lava({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, _) {
        return MaterialApp(
          title: 'Scarvs',
          theme: notifier.darkTheme ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRouter.signUpRoute,
        );
      },
    );
  }
}
