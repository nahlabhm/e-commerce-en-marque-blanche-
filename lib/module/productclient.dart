import 'dart:convert';

import 'package:appmobile/module/rating.dart';

class Productclient {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final double price;
  final int? stock;
  final String? sku;
  final String? status;
  final String? id;
  final String? favorite;
  final List<Rating>? rating;

  Productclient({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.price,
    this.id,
    this.rating,
    this.favorite,
    this.stock,
    this.sku,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'price': price,
      'id': id,
      'rating': rating,
      'favorite': favorite,
      'stock': stock,
      'sku': sku,
      'status': status,
    };
  }

  factory Productclient.fromMap(Map<String, dynamic> map) {
    return Productclient(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      favorite: map['favorite'] ?? '',
      stock: map['stock'] ?? 0,
      sku: map['sku'],
      status: map['status'],
      rating: map['ratings'] != null
          ? List<Rating>.from(
              map['ratings']?.map(
                (x) => Rating.fromMap(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Productclient.fromJson(String source) =>
      Productclient.fromMap(json.decode(source));
}
