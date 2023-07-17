import 'dart:convert';

import 'package:appmobile/module/comments.dart';
import 'package:appmobile/module/rating.dart';

class Product {
  final String name;
  final String description;
  final double quantity;
  final List<String> images;
  final String category;
  final double price;
  final String? id;
  final String? favorite;
  final List<Rating>? rating;
  final List<Comment>? comments;
  final String brand; // Add Brand property
  final String color;
  final String model;
  final String screenSize;
  final String style;
  final String specialFeature;
  final String manufacturer;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.images,
    required this.category,
    required this.price,
    this.id,
    this.rating,
    this.favorite,
    this.comments,
    required this.brand, // Add Brand property
    required this.color,
    required this.model,
    required this.screenSize,
    required this.style,
    required this.specialFeature,
    required this.manufacturer,
  });

  bool get isFavorite => favorite != null;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'quantity': quantity,
      'images': images,
      'category': category,
      'price': price,
      'id': id,
      'rating': rating,
      'favorite': favorite,
      'comments': comments,
      'brand': brand, // Add Brand property
      'color': color,
      'model': model,
      'screenSize': screenSize,
      'style': style,
      'specialFeature': specialFeature,
      'manufacturer': manufacturer,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      favorite: map['favorite'] ?? '',
      rating: map['ratings'] != null
          ? List<Rating>.from(map['ratings']?.map((x) => Rating.fromMap(x)))
          : null,
      comments: map['comments'] != null
          ? List<Comment>.from(map['comments']?.map((x) => Comment.fromMap(x)))
          : [],
      brand: map['brand'] ?? '', // Add Brand property
      color: map['color'] ?? '',
      model: map['model'] ?? '',
      screenSize: map['screenSize'] ?? '',
      style: map['style'] ?? '',
      specialFeature: map['specialFeature'] ?? '',
      manufacturer: map['manufacturer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
