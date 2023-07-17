import 'dart:convert';

class Payment {
  final int card;
  final int cv;
  final DateTime createdAt;
  final String name;

  Payment({
    required this.card,
    required this.cv,
    required this.createdAt,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'card': card,
      'cv': cv,
      'createdAt': createdAt.toIso8601String(),
      'name': name,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      card: map['card'],
      cv: map['cv'],
      createdAt: DateTime.parse(map['createdAt']),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) => Payment.fromMap(json.decode(source));
}
