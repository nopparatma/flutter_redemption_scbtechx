class ProductDataRs {
  List<Product>? product;

  ProductDataRs({product});

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
}

class Product {
  String? name;
  String? description;
  String? image;
  int? price;
  double? rateBahtPerPoint;
  int? stock;

  Product({name, description, image, price, rateBahtPerPoint, stock});

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
}
