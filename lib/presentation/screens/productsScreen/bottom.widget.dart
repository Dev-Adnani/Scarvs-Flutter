import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/models/product.model.dart';
import 'package:scarvs/presentation/widgets/custom.text.widget.dart';

class ProductsList extends StatelessWidget {
  final dynamic snapshot;
  final bool themeFlag;

  ProductsList({required this.snapshot, required this.themeFlag});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      itemCount: snapshot.length,
      // itemCount: 2,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        ProductData _prod = snapshot[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 16.0),
          child: GestureDetector(
            // onTap: () =>  Navigator.of(context).pushReplacement(newRoute),
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
                    child: Image.network(_prod.productImage),
                  ),
                  Text(
                    _prod.productName,
                    style: CustomTextWidget.bodyTextB4(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                  Text(
                    _prod.productPrice,
                    style: CustomTextWidget.bodyText3(
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
