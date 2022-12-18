// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.image,
    this.title,
    this.price,
    this.isOrder,
  });

  String? image;
  String? title;
  String? price;
  bool? isOrder;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        image: json["image"],
        title: json["title"],
        price: json["price"],
        isOrder: json["isOrder"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "price": price,
        "isOrder": isOrder,
      };
}
