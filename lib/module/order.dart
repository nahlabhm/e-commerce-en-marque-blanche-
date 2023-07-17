


import 'dart:convert';

import 'package:appmobile/module/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantity;
  final String address;
  final String userId;
  final String username;
  final int telephone;
  final int orderedAt;
  final int status;
  final double totalPrice;
  final int card;
  final int cv;
final String createdAt;

  Order({
    required this.id,
    required this.products,
    required this.quantity,
    required this.address,
    required this.userId,
    required this.username,
    required this.telephone,
    required this.orderedAt,
    required this.status,
    required this.totalPrice,
    required this.card,
    required this.cv,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'address': address,
      'userId': userId,
      'username': username,
      'telephone': telephone,
      'orderedAt': orderedAt,
      'status': status,
      'totalPrice': totalPrice,
      'card': card,
      'cv': cv,
      'createdAt': createdAt,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['id'] ?? '',
      products: List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
      quantity: List<int>.from(map['quantity']),
      address: map['address'] ?? '',
      userId: map['userId'] ?? '',
      username: map['username'] ?? '',
      telephone: map['telephone'] ?? 0,
      orderedAt: map['orderedAt'] ?? 0,
      status: map['status'] ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
      card: map['card'],
      cv: map['cv'],
      createdAt:map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
