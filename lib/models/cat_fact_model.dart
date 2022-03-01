// To parse this JSON data, do
//
//     final catFactModel = catFactModelFromJson(jsonString);

import 'dart:convert';

CatFactModel catFactModelFromJson(String str) => CatFactModel.fromJson(json.decode(str));

String catFactModelToJson(CatFactModel data) => json.encode(data.toJson());

class CatFactModel {
  CatFactModel({
    this.fact,
    this.length,
  });

  String? fact;
  int? length;

  factory CatFactModel.fromJson(Map<String, dynamic> json) => CatFactModel(
    fact: json["fact"],
    length: json["length"],
  );

  Map<String, dynamic> toJson() => {
    "fact": fact,
    "length": length,
  };
}
