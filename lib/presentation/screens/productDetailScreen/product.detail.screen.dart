import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final dynamic argument;
  const ProductDetail({Key? key, this.argument}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Test'),
      ),
    );
  }
}
