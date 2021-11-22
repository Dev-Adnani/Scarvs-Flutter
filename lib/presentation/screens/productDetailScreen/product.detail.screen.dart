import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final ProductDetailsArgs productDetailsArguements;
  const ProductDetail({required this.productDetailsArguements});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.productDetailsArguements.id.toString()),
      ),
    );
  }
}

class ProductDetailsArgs {
  final dynamic id;
  const ProductDetailsArgs({required this.id});
}
