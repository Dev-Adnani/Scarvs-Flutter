import 'package:flutter/material.dart';
import 'package:scarvs/core/models/product.model.dart';

class ProductsList extends StatelessWidget {
  final dynamic snapshot;
  ProductsList({required this.snapshot});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (context, index) {
        ProductData _prod = snapshot[index];
        return ListTile(
          title: Text(_prod.productName),
          subtitle: Text(_prod.productPrice),
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(_prod.productImage),
          ),
        );
      },
    );
  }
}
