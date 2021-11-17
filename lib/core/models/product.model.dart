class ProductModel {
  ProductModel({
    required this.filled,
    required this.received,
    required this.data,
  });
  late final bool filled;
  late final bool received;
  late final List<ProductData> data;

  ProductModel.fromJson(Map<String, dynamic> json) {
    filled = json['filled'];
    received = json['received'];
    data = List.from(json['data']).map((e) => ProductData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['filled'] = filled;
    _data['received'] = received;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProductData {
  ProductData({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productCategory,
    required this.productImage,
  });
  late final int productId;
  late final String productName;
  late final String productDescription;
  late final String productPrice;
  late final String productCategory;
  late final String productImage;

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productPrice = json['product_price'];
    productCategory = json['product_category'];
    productImage = json['product_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['product_description'] = productDescription;
    _data['product_price'] = productPrice;
    _data['product_category'] = productCategory;
    _data['product_image'] = productImage;
    return _data;
  }
}
