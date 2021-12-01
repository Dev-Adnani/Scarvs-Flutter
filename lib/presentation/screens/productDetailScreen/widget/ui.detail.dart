import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/app/constants/app.assets.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/models/productID.model.dart';
import 'package:scarvs/core/notifiers/cart.notifier.dart';
import 'package:scarvs/core/notifiers/size.notifier.dart';
import 'package:scarvs/core/notifiers/user.notifier.dart';
import 'package:scarvs/core/utils/snackbar.util.dart';
import 'package:scarvs/presentation/screens/productDetailScreen/widget/select.size.dart';
import 'package:scarvs/presentation/widgets/custom.back.btn.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

Widget productUI({
  required BuildContext context,
  required bool themeFlag,
  required SingleProductData snapshot,
}) {
  CartNotifier cartNotifier = Provider.of<CartNotifier>(context, listen: false);
  UserNotifier userNotifier = Provider.of<UserNotifier>(context, listen: false);
  SizeNotifier sizeNotifier = Provider.of<SizeNotifier>(context, listen: false);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomBackPop(themeFlag: themeFlag),
      Column(
        children: [
          Center(
            child: Text(
              snapshot.productName,
              style: CustomTextWidget.bodyTextB1(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
            ),
          ),
          vSizedBox2,
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                child: themeFlag
                    ? Image.asset(AppAssets.diamondWhite)
                    : Image.asset(AppAssets.diamondBlack),
              ),
              Hero(
                tag: Key(snapshot.productId.toString()),
                child: InteractiveViewer(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image.network(snapshot.productImage),
                  ),
                ),
              ),
            ],
          ),
          vSizedBox2,
          Text(
            snapshot.productDescription,
            style: CustomTextWidget.bodyText3(
              color: themeFlag ? AppColors.creamColor : AppColors.mirage,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      vSizedBox2,
      Text(
        'Choose Size',
        style: CustomTextWidget.bodyTextB4(
          color: themeFlag ? AppColors.creamColor : AppColors.mirage,
        ),
      ),
      vSizedBox2,
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        child: selectSize(context: context, themeFlag: themeFlag),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ ${snapshot.productPrice}',
              style: CustomTextWidget.bodyTextUltra(
                color: themeFlag ? AppColors.creamColor : AppColors.mirage,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: themeFlag ? AppColors.creamColor : AppColors.mirage,
                enableFeedback: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                cartNotifier
                    .addToCart(
                  useremail: userNotifier.getUserEmail!,
                  productPrice: snapshot.productPrice,
                  productName: snapshot.productName,
                  productCategory: snapshot.productCategory,
                  productImage: snapshot.productImage,
                  context: context,
                  productSize: sizeNotifier.getSize,
                )
                    .then((value) {
                  if (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackUtil.stylishSnackBar(
                        text: 'Added To Cart',
                        context: context,
                      ),
                    );
                    Navigator.of(context).pushNamed(AppRouter.homeRoute);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackUtil.stylishSnackBar(
                        text: 'Oops Something Went Wrong',
                        context: context,
                      ),
                    );
                  }
                });
              },
              child: Text(
                'Buy Now',
                style: CustomTextWidget.bodyTextB2(
                  color: themeFlag ? AppColors.mirage : AppColors.creamColor,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}
