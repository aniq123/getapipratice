import 'dart:convert';

class login {
  String name;
  String password;
  String Number;
  String email;
  login({
    required this.name,
    required this.password,
    required this.Number,
    required this.email,
  });

  login copyWith({
    String? name,
    String? password,
    String? Number,
    String? email,
  }) {
    return login(
      name: name ?? this.name,
      password: password ?? this.password,
      Number: Number ?? this.Number,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'password': password});
    result.addAll({'Number': Number});
    result.addAll({'email': email});

    return result;
  }

  factory login.fromMap(Map<String, dynamic> map) {
    return login(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      Number: map['Number'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory login.fromJson(String source) => login.fromMap(json.decode(source));

  @override
  String toString() {
    return 'login(name: $name, password: $password, Number: $Number, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is login &&
        other.name == name &&
        other.password == password &&
        other.Number == Number &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^ password.hashCode ^ Number.hashCode ^ email.hashCode;
  }
}
