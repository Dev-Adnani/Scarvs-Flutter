import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.assets.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/models/productID.model.dart';
import 'package:scarvs/core/notifiers/product.notifier.dart';
import 'package:scarvs/core/notifiers/theme.notifier.dart';
import 'package:scarvs/presentation/screens/ProductScreens/productDetailScreen/widget/ui.detail.dart';
import 'package:scarvs/presentation/widgets/custom.loader.dart';

class ProductDetail extends StatefulWidget {
  final ProductDetailsArgs productDetailsArguements;
  const ProductDetail({required this.productDetailsArguements});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    return Scaffold(
      backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 45, 20, 0),
          child: Consumer<ProductNotifier>(builder: (context, notifier, _) {
            return FutureBuilder(
              future: notifier.fetchProductDetail(
                context: context,
                id: widget.productDetailsArguements.id.toString(),
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: customLoader(
                        context: context,
                        themeFlag: themeFlag,
                        lottieAsset: AppAssets.onBoardingOne,
                        text: 'Please Wait Till It Loads'),
                  );
                } else if (!snapshot.hasData) {
                  return Center(
                    child: customLoader(
                      context: context,
                      themeFlag: themeFlag,
                      text: 'Oops Some Error Occurred',
                      lottieAsset: AppAssets.error,
                    ),
                  );
                } else {
                  var _snapshot = snapshot.data as SingleProductData;
                  return productUI(
                    context: context,
                    themeFlag: themeFlag,
                    snapshot: _snapshot,
                  );
                }
              },
            );
          }),
        ),
      ),
    );
  }
}

class ProductDetailsArgs {
  final dynamic id;
  const ProductDetailsArgs({required this.id});
}
