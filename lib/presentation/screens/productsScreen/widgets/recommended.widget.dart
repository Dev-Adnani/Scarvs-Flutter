import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/models/product.model.dart';
import 'package:scarvs/presentation/screens/productDetailScreen/product.detail.screen.dart';
import 'package:scarvs/presentation/widgets/custom.text.widget.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

Widget productForYou(
    {required snapshot, required themeFlag, required BuildContext context}) {
  return ListView.builder(
    physics: ScrollPhysics(),
    shrinkWrap: true,
    itemCount: snapshot.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      ProductData prod = snapshot[index];
      return GestureDetector(
        onTap: () {
          var productId = prod.productName;
          print(productId);
          Navigator.of(context).pushNamed(
            AppRouter.prodDetailRoute,
            arguments: ProductDetailsArgs(id: productId),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(prod.productImage),
                ),
                vSizedBox1,
                Text(
                  prod.productName,
                  style: CustomTextWidget.bodyText3(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
                Text(
                  '₹ ${prod.productPrice.toString()}',
                  style: CustomTextWidget.bodyText3(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
