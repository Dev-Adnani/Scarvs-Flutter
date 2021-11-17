import 'package:flutter/material.dart';
import 'package:scarvs/core/models/product.model.dart';

class ProductsList extends StatelessWidget {
  final dynamic snapshot;
  ProductsList({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: snapshot.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        ProductData _prod = snapshot[index];
        return Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(_prod.productImage),
              ),
            ],
          ),
        );
      },
    );
  }
}
