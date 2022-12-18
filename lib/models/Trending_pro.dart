// To parse this JSON data, do
//
//     final trendingPro = trendingProFromJson(jsonString);

import 'dart:convert';

TrendingPro trendingProFromJson(String str) =>
    TrendingPro.fromJson(json.decode(str));

String trendingProToJson(TrendingPro data) => json.encode(data.toJson());

class TrendingPro {
  TrendingPro({
    this.image,
    this.title,
    this.review,
  });

  String? image;
  String? title;
  int? review;

  factory TrendingPro.fromJson(Map<String, dynamic> json) => TrendingPro(
        image: json["image"],
        title: json["title"],
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "review": review,
      };
}
