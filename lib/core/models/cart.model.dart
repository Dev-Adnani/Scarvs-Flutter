class CartData {
  CartData({
    required this.filled,
    required this.received,
    required this.data,
  });
  late final bool filled;
  late final bool received;
  late final List<CartItems> data;

  CartData.fromJson(Map<String, dynamic> json) {
    filled = json['filled'];
    received = json['received'];
    data = List.from(json['data']).map((e) => CartItems.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['filled'] = filled;
    _data['received'] = received;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class CartItems {
  CartItems({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productImage,
    required this.productSize,
  });
  late final int productId;
  late final String productName;
  late final String productPrice;
  late final String productCategory;
  late final String productImage;
  late final String productSize;

  CartItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productCategory = json['product_category'];
    productImage = json['product_image'];
    productSize = json['product_size'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_name'] = productName;
    _data['product_price'] = productPrice;
    _data['product_category'] = productCategory;
    _data['product_image'] = productImage;
    _data['product_size'] = productSize;
    return _data;
  }
}

class CartDelete {
  CartDelete({
    required this.deleted,
    required this.data,
  });
  late final bool deleted;
  late final String data;

  CartDelete.fromJson(Map<String, dynamic> json) {
    deleted = json['deleted'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['deleted'] = deleted;
    _data['data'] = data;
    return _data;
  }
}

class AddToCartModel {
  AddToCartModel({
    required this.added,
    required this.data,
  });
  late final bool added;
  late final String data;

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    added = json['added'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['added'] = added;
    _data['data'] = data;
    return _data;
  }
}
