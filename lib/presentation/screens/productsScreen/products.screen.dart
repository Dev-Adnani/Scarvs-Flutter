import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scarvs/core/notifiers/product.notifier.dart';
import 'package:scarvs/presentation/screens/ProductsScreen/test.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First layer"),
      ),
      body: Container(
        child: Consumer<ProductNotifier>(
          builder: (context, notifier, _) {
            return FutureBuilder(
                future: notifier.fetchProducts(context: context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('No Data'));
                  } else {
                    var _snapshot = snapshot.data as List;
                    return ProductsList(snapshot: _snapshot);
                  }
                });
          },
        ),
      ),
    );
  }
}
