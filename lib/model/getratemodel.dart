// To parse this JSON data, do
//
//     final getratemodel = getratemodelFromJson(jsonString);

import 'dart:convert';

Getratemodel getratemodelFromJson(String str) =>
    Getratemodel.fromJson(json.decode(str));

String getratemodelToJson(Getratemodel data) => json.encode(data.toJson());

class Getratemodel {
  String fromCurrency;
  String convCurrency;
  DateTime date;
  double rate;

  Getratemodel({
    required this.fromCurrency,
    required this.convCurrency,
    required this.date,
    required this.rate,
  });

  factory Getratemodel.fromJson(Map<String, dynamic> json) => Getratemodel(
        fromCurrency: json["from_currency"],
        convCurrency: json["conv_currency"],
        date: DateTime.parse(json["date"]),
        rate: json["rate"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "from_currency": fromCurrency,
        "conv_currency": convCurrency,
        "date": date.toIso8601String(),
        "rate": rate,
      };
}
