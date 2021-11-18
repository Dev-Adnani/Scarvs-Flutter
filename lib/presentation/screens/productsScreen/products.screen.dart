import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.assets.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/notifiers/product.notifier.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/presentation/screens/productsScreen/bottom.widget.dart';
import 'package:scarvs/presentation/widgets/custom.text.widget.dart';
import 'package:scarvs/presentation/widgets/dimensions.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Dev',
                      style: CustomTextWidget.bodyTextB1(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox1,
                    Text(
                      'What Would You Like To Wear Today ??',
                      style: CustomTextWidget.bodyText3(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox2,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.rawSienna,
                            AppColors.mediumPurple,
                            AppColors.fuchsiaPink,
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Items With ',
                              style: CustomTextWidget.bodyTextB2(
                                color: themeFlag
                                    ? AppColors.creamColor
                                    : AppColors.mirage,
                              ),
                            ),
                            Text(
                              'Free Shipping',
                              style: CustomTextWidget.bodyTextB3(
                                color: themeFlag
                                    ? AppColors.creamColor
                                    : AppColors.mirage,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColors.creamColor,
                                      enableFeedback: true,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      )),
                                  onPressed: () {},
                                  child: Text(
                                    'Check',
                                    style: CustomTextWidget.bodyText3(
                                      color: AppColors.mirage,
                                    ),
                                  ),
                                ),
                                hSizedBox2,
                                Container(
                                  height: 115,
                                  width: 180,
                                  child: Image.asset(AppAssets.homeJordan),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    vSizedBox2,
                    Text(
                      'Shoes For You',
                      style: CustomTextWidget.bodyTextB2(
                        color:
                            themeFlag ? AppColors.creamColor : AppColors.mirage,
                      ),
                    ),
                    vSizedBox1,
                    Container(
                      height: 250,
                      width: 400,
                      child: Consumer<ProductNotifier>(
                        builder: (context, notifier, _) {
                          return FutureBuilder(
                              future: notifier.fetchProducts(context: context),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (!snapshot.hasData) {
                                  return Center(child: Text('No Data'));
                                } else {
                                  var _snapshot = snapshot.data as List;
                                  return ProductsList(
                                      snapshot: _snapshot,
                                      themeFlag: themeFlag);
                                }
                              });
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
