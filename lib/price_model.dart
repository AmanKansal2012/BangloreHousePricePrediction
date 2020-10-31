// To parse this JSON data, do
//
//     final priceModel = priceModelFromJson(jsonString);

import 'dart:convert';

PriceModel priceModelFromJson(String str) => PriceModel.fromJson(json.decode(str));

String priceModelToJson(PriceModel data) => json.encode(data.toJson());

class PriceModel {
  PriceModel({
    this.estimatedPrice,
  });

  double estimatedPrice;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
    estimatedPrice: json["estimated_price"],
  );

  Map<String, dynamic> toJson() => {
    "estimated_price": estimatedPrice,
  };
}
