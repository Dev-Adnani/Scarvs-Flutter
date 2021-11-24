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
        crossAxisCount: 2, mainAxisSpacing: 10),
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
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: AppColors.creamColor,
            //     width: 5.0,
            //   ),
            //   borderRadius: BorderRadius.circular(40.0),
            //   color: themeFlag ? AppColors.mirage : AppColors.creamColor,
            // ),
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.40,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Image.network(prod.productImage),
                  ),
                  Text(
                    prod.productName,
                    style: CustomTextWidget.bodyText3(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                  Text(
                    '₹ ${prod.productPrice}',
                    style: CustomTextWidget.bodyText3(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
