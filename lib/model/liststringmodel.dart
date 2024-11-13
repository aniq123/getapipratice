// To parse this JSON data, do
//
//     final liststringmodel = liststringmodelFromJson(jsonString);

import 'dart:convert';

Liststringmodel liststringmodelFromJson(String str) =>
    Liststringmodel.fromJson(json.decode(str));

String liststringmodelToJson(Liststringmodel data) =>
    json.encode(data.toJson());

class Liststringmodel {
  List<String>? data;

  Liststringmodel({
    this.data,
  });

  factory Liststringmodel.fromJson(Map<String, dynamic> json) =>
      Liststringmodel(
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x)),
      };
}
