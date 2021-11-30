import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:scarvs/app/routes/api.routes.dart';

class CartAPI {
  final client = http.Client();
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': "*",
  };

  Future addToCart({
    required String useremail,
    required String productPrice,
    required String productName,
    required String productCategory,
    required String productImage,
    required BuildContext context,
    required String productSize,
  }) async {
    const subUrl = '/cart/add-to-cart';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.post(uri,
        headers: headers,
        body: jsonEncode({
          "useremail": useremail,
          "product_price": productPrice,
          "product_name": productName,
          "product_category": productCategory,
          "product_image": productImage,
          "product_size": productSize
        }));
    final dynamic body = response.body;
    return body;
  }

  Future checkCartData({
    required String useremail,
    required BuildContext context,
  }) async {
    var subUrl = '/cart/$useremail';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.get(
      uri,
      headers: headers,
    );
    final dynamic body = response.body;
    return body;
  }

  Future deleteFromCart({
    required String productId,
    required BuildContext context,
  }) async {
    var subUrl = '/cart/delete/$productId';
    final Uri uri = Uri.parse(ApiRoutes.baseurl + subUrl);
    final http.Response response = await client.delete(
      uri,
      headers: headers,
    );
    final dynamic body = response.body;
    return body;
  }
}
