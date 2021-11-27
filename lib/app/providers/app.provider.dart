import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:scarvs/core/notifiers/authentication.notifer.dart';
import 'package:scarvs/core/notifiers/product.notifier.dart';
import 'package:scarvs/core/notifiers/size.notifier.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
    ChangeNotifierProvider(create: (_) => AuthenticationNotifier()),
    ChangeNotifierProvider(create: (_) => UserNotifier()),
    ChangeNotifierProvider(create: (_) => ProductNotifier()),
    ChangeNotifierProvider(create: (_) => SizeNotifier()),
  ];
}
