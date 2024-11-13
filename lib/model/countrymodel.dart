// To parse this JSON data, do
//
//     final countrymodel = countrymodelFromJson(jsonString);

import 'dart:convert';

List<Countrymodel> countrymodelFromJson(String str) => List<Countrymodel>.from(
    json.decode(str).map((x) => Countrymodel.fromJson(x)));

String countrymodelToJson(List<Countrymodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Countrymodel {
  AlphaTwoCode alphaTwoCode;
  List<String> domains;
  Country country;
  String name;
  String? stateProvince;
  List<String> webPages;

  Countrymodel({
    required this.alphaTwoCode,
    required this.domains,
    required this.country,
    required this.name,
    required this.stateProvince,
    required this.webPages,
  });

  factory Countrymodel.fromJson(Map<String, dynamic> json) => Countrymodel(
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: countryValues.map[json["country"]]!,
        name: json["name"],
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "country": countryValues.reverse[country],
        "name": name,
        "state-province": stateProvince,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
      };
}

enum AlphaTwoCode { US }

final alphaTwoCodeValues = EnumValues({"US": AlphaTwoCode.US});

enum Country { UNITED_STATES }

final countryValues = EnumValues({"United States": Country.UNITED_STATES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
