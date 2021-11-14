import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  ];
}
