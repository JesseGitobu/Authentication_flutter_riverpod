import 'dart:convert';

class User {
  final String id;
  final String firstname;
  final String secondname;
  final String email;
  final String phone;
  final String password;

  User({
    required this.id,
    required this.firstname,
    required this.secondname,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'secondname': secondname,
      'email': email,
      'phone': phone,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      firstname: map['firstname'] ?? '',
      secondname: map['secondname'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? firstname,
    String? secondname,
    String? email,
    String? phone,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      secondname: secondname ?? this.secondname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }
}
