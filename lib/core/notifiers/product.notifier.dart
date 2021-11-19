import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scarvs/core/api/product.api.dart';
import 'package:scarvs/core/models/product.model.dart';
import 'package:scarvs/core/utils/snackbar.util.dart';

class ProductNotifier with ChangeNotifier {
  final ProductAPI _productAPI = ProductAPI();

  Future fetchProducts({required BuildContext context}) async {
    try {
      var products = await _productAPI.fetchProducts();
      var response = ProductModel.fromJson(jsonDecode(products));

      final _productBody = response.data;
      final _productFilled = response.filled;
      final _productReceived = response.received;

      if (_productReceived && _productFilled) {
        return _productBody;
      } else if (!_productFilled && _productReceived) {
        return [];
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackUtil.stylishSnackBar(
          text: 'Oops No You Need A Good Internet Connection',
          context: context));
    } catch (e) {
      print(e);
    }
  }

  Future fetchProductDetail(
      {required BuildContext context, required String id}) async {
    try {
      var products = await _productAPI.fetchProductDetail(id: id);
      var response = ProductModel.fromJson(jsonDecode(products));

      final _productBody = response.data;
      final _productFilled = response.filled;
      final _productReceived = response.received;

      if (_productReceived && _productFilled) {
        return _productBody;
      } else if (!_productFilled && _productReceived) {
        return [];
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackUtil.stylishSnackBar(
            text: 'Oops No You Need A Good Internet Connection',
            context: context),
      );
    } catch (e) {
      print(e);
    }
  }
}