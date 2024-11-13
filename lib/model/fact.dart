// To parse this JSON data, do
//
//     final fact = factFromJson(jsonString);

import 'dart:convert';

Fact factFromJson(String str) => Fact.fromJson(json.decode(str));

String factToJson(Fact data) => json.encode(data.toJson());

class Fact {
  String fact;
  int length;

  Fact({
    required this.fact,
    required this.length,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        fact: json["fact"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "fact": fact,
        "length": length,
      };

  Fact copyWith({
    String? fact,
    int? length,
  }) {
    return Fact(
      fact: fact ?? this.fact,
      length: length ?? this.length,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'fact': fact});
    result.addAll({'length': length});

    return result;
  }

  factory Fact.fromMap(Map<String, dynamic> map) {
    return Fact(
      fact: map['fact'] ?? '',
      length: map['length']?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'Fact(fact: $fact, length: $length)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Fact && other.fact == fact && other.length == length;
  }

  @override
  int get hashCode => fact.hashCode ^ length.hashCode;
}
