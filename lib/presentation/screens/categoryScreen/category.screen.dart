import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/notifiers/product.notifier.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/presentation/screens/categoryScreen/widgets/category.widget.dart';
import 'package:scarvs/presentation/widgets/custom.back.btn.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryScreenArgs categoryScreenArgs;

  const CategoryScreen({Key? key, required this.categoryScreenArgs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBackButton(
              route: AppRouter.homeRoute,
              themeFlag: themeFlag,
            ),
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  child: Consumer<ProductNotifier>(
                    builder: (context, notifier, _) {
                      return FutureBuilder(
                        future: notifier.fetchProductCategory(
                          context: context,
                          categoryName: categoryScreenArgs.categoryName,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: Text('Wait For Data'),
                            );
                          } else if (!snapshot.hasData) {
                            return Center(
                              child: Text('No Data'),
                            );
                          } else {
                            var _snapshot = snapshot.data as List;
                            return categoryWidget(
                                snapshot: _snapshot,
                                themeFlag: themeFlag,
                                context: context);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryScreenArgs {
  final dynamic categoryName;
  const CategoryScreenArgs({required this.categoryName});
}
