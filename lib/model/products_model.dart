import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  ProductsModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    products: List<Product>.from(
        json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category; // ✅ خليتها String
  final double? price;
  final String? thumbnail;
  final String? returnPolicy;
  final int? stock;
  final String? brand;
  final double? rating;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.thumbnail,
    required this.returnPolicy,
    required this.stock,
    required this.brand,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    category: json["category"], // ✅ String مباشرة
    price: json["price"]?.toDouble(),
    thumbnail: json["thumbnail"],
    returnPolicy: json["returnPolicy"],
    stock: json["stock"],
    brand: json["brand"],
    rating: json["rating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": category,
    "price": price,
    "thumbnail": thumbnail,
    "returnPolicy": returnPolicy,
    "stock": stock,
    "brand": brand,
    "rating": rating,
  };
}
