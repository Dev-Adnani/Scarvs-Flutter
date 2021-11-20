import 'package:flutter/material.dart';
import 'package:scarvs/app/constants/app.colors.dart';
import 'package:scarvs/core/models/product.model.dart';
import 'package:scarvs/presentation/widgets/custom.text.widget.dart';
import 'package:scarvs/presentation/widgets/dimensions.widget.dart';

class ProductsList extends StatelessWidget {
  final dynamic snapshot;
  final bool themeFlag;

  ProductsList({required this.snapshot, required this.themeFlag});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        ProductData _prod = snapshot[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 16.0),
          child: Container(
            height: 150,
            width: 150,
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.network(_prod.productImage),
                ),
                vSizedBox1,
                Text(
                  _prod.productName,
                  style: CustomTextWidget.bodyText3(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
