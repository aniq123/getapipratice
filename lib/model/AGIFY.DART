// To parse this JSON data, do
//
//     final age = ageFromJson(jsonString);

import 'dart:convert';

Age ageFromJson(String str) => Age.fromJson(json.decode(str));

String ageToJson(Age data) => json.encode(data.toJson());

class Age {
    int count;
    String name;
    int age;

    Age({
        required this.count,
        required this.name,
        required this.age,
    });

    factory Age.fromJson(Map<String, dynamic> json) => Age(
        count: json["count"],
        name: json["name"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "age": age,
    };

  Age copyWith({
    int? count,
    String? name,
    int? age,
  }) {
    return Age(
      count: count ?? this.count,
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'count': count});
    result.addAll({'name': name});
    result.addAll({'age': age});
  
    return result;
  }

  factory Age.fromMap(Map<String, dynamic> map) {
    return Age(
      count: map['count']?.toInt() ?? 0,
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Age.fromJson(String source) => Age.fromMap(json.decode(source));

  @override
  String toString() => 'Age(count: $count, name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Age &&
      other.count == count &&
      other.name == name &&
      other.age == age;
  }

  @override
  int get hashCode => count.hashCode ^ name.hashCode ^ age.hashCode;
}
