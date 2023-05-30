import 'package:equatable/equatable.dart';

class ProductDataRs {
  List<Product>? product;

  ProductDataRs({this.product});

  ProductDataRs.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductDataRs{product: $product}';
  }
}

class Product {
  String? name;
  String? description;
  String? image;
  num? price;
  num? rateBahtPerPoint;
  num? stock;

  Product({this.name = '', this.description = '', this.image = '', this.price = 0, this.rateBahtPerPoint = 0, this.stock = 0});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    rateBahtPerPoint = json['rateBahtPerPoint'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['rateBahtPerPoint'] = rateBahtPerPoint;
    data['stock'] = stock;
    return data;
  }

  @override
  String toString() {
    return 'Product{name: $name, description: $description, image: $image, price: $price, rateBahtPerPoint: $rateBahtPerPoint, stock: $stock}';
  }
}
