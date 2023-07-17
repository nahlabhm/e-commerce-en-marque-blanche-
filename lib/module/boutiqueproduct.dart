
import 'dart:convert';

import 'package:appmobile/module/rating.dart';

import 'comments.dart';



class Productboutique {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final List<Rating>? rating;
  final List<Comment>? comments;
  final String color;
  final double promotion;
  final String screenSize;
  final String marque;
  final String materiau;
  final String country;
  final double livraison;

  Productboutique({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
    this.comments,
    required this.color,
    required this.promotion,
    required this.screenSize,
    required this.marque,
    required this.materiau,
    required this.country,
    required this.livraison,
  });

  bool get isFavorite => id != null;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating != null ? rating!.map((rating) => rating.toMap()).toList() : null,
      'comments': comments != null ? comments!.map((comment) => comment.toMap()).toList() : null,
      'color': color,
      'promotion': promotion,
      'screenSize': screenSize,
      'marque': marque,
      'materiau': materiau,
      'country': country,
      'livraison': livraison,
    };
  }

  factory Productboutique.fromMap(Map<String, dynamic> map) {
    return Productboutique(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['id'],
      rating: map['rating'] != null
          ? List<Rating>.from(map['rating']?.map((x) => Rating.fromMap(x)))
          : null,
      comments: map['comments'] != null
          ? List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x)))
          : null,
      color: map['color'] ?? '',
      promotion: map['promotion']?.toDouble() ?? 0.0,
      screenSize: map['screenSize'] ?? '',
      marque: map['marque'] ?? '',
      materiau: map['materiau'] ?? '',
      country: map['country'] ?? '',
      livraison: map['livraison']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Productboutique.fromJson(String source) => Productboutique.fromMap(json.decode(source));
}
