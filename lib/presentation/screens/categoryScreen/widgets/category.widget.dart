import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/models/product.model.dart';
import 'package:scarvs/presentation/screens/productDetailScreen/product.detail.screen.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';

Widget categoryWidget(
    {required snapshot, required themeFlag, required BuildContext context}) {
  return GridView.builder(
    physics: ScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (3 / 2),
    ),
    itemCount: snapshot.length,
    itemBuilder: (context, index) {
      ProductData prod = snapshot[index];
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.prodDetailRoute,
            arguments: ProductDetailsArgs(id: prod.productId),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
                width: 5.0,
              ),
              color: AppColors.rawSienna,
            ),
            height: MediaQuery.of(context).size.height * 0.20,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: Image.network(prod.productImage),
                ),
                Text(
                  prod.productName,
                  style: CustomTextWidget.bodyText3(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                ),
                Text(
                  '₹ ${prod.productPrice}',
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
