import 'dart:convert';

class Employe {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final List<dynamic> cart;
  final int telephone;

  Employe({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.cart,
    required this.telephone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'cart': cart,
      'telephone': telephone,
    };
  }

  factory Employe.fromMap(Map<String, dynamic> map) {
    return Employe(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
          (x) => Map<String, dynamic>.from(x),
        ),
      ),
      telephone: map['telephone'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Employe.fromJson(String source) => Employe.fromMap(json.decode(source));

  Employe copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    List<dynamic>? cart,
    int? telephone,
  }) {
    return Employe(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      cart: cart ?? this.cart,
      telephone: telephone ?? this.telephone,
    );
  }
}
