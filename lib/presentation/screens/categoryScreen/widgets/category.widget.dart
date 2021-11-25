import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/app/routes/app.routes.dart';
import 'package:scarvs/core/models/product.model.dart';
import 'package:scarvs/presentation/screens/productDetailScreen/product.detail.screen.dart';
import 'package:scarvs/presentation/widgets/custom.text.style.dart';

Widget categoryWidget(
    {required snapshot, required themeFlag, required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 0.700,
      ),
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        ProductData prod = snapshot[index];
        return _showProducts(
            context: context, prod: prod, themeFlag: themeFlag);
      },
    ),
  );
}

Widget _showProducts({
  required BuildContext context,
  required ProductData prod,
  required bool themeFlag,
}) {
  return Container(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      color: Colors.white,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRouter.prodDetailRoute,
            arguments: ProductDetailsArgs(id: prod.productId),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: Image.network(prod.productImage)),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    prod.productName,
                    style: CustomTextWidget.bodyText3(
                      color:
                          themeFlag ? AppColors.mirage : AppColors.creamColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '₹  ${prod.productPrice}',
                    style: CustomTextWidget.bodyText3(
                      color:
                          themeFlag ? AppColors.mirage : AppColors.creamColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
