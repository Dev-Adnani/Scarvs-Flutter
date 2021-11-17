import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.assets.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/notifiers/product.notifier.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/presentation/widgets/custom.text.widget.dart';
import 'package:scarvs/presentation/widgets/dimensions.dart';

import 'test.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        body: Padding(
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.creamColor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 2,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Check',
                                  style: CustomTextWidget.bodyTextB1(
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
                  // Container(
                  //   child: Consumer<ProductNotifier>(
                  //     builder: (context, notifier, _) {
                  //       return FutureBuilder(
                  //           future: notifier.fetchProducts(context: context),
                  //           builder: (context, snapshot) {
                  //             if (snapshot.connectionState ==
                  //                 ConnectionState.waiting) {
                  //               return Center(
                  //                   child: CircularProgressIndicator());
                  //             } else if (!snapshot.hasData) {
                  //               return Center(child: Text('No Data'));
                  //             } else {
                  //               var _snapshot = snapshot.data as List;
                  //               return ProductsList(snapshot: _snapshot);
                  //             }
                  //           });
                  //     },
                  //   ),
                  // )
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 140,
                                child: Image.asset(AppAssets.homeJordanT),
                              ),
                              Text(
                                'Nike Air Jordan',
                                style: CustomTextWidget.bodyTextB3(
                                  color: themeFlag
                                      ? AppColors.creamColor
                                      : AppColors.mirage,
                                ),
                              ),
                              Text(
                                '₹ 8000 ',
                                style: CustomTextWidget.bodyTextB3(
                                  color: themeFlag
                                      ? AppColors.creamColor
                                      : AppColors.mirage,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 140,
                                child: Image.asset(AppAssets.homeJordan),
                              ),
                              Text(
                                'Nike Air 2 Jordan',
                                style: CustomTextWidget.bodyTextB3(
                                  color: themeFlag
                                      ? AppColors.creamColor
                                      : AppColors.mirage,
                                ),
                              ),
                              Text(
                                '₹ 8989 ',
                                style: CustomTextWidget.bodyTextB3(
                                  color: themeFlag
                                      ? AppColors.creamColor
                                      : AppColors.mirage,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
