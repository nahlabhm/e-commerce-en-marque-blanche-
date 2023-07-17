import 'dart:convert';

class Client {
  final String? id;
  final String nameboutique;
  final String address;
  final String category;
    final String numero;
  final List<String> images;// Changed type to List<String>
  final String bio;
  final List<String>? following;
 

  Client({
     this.id,
    required this.nameboutique,
    required this.address,
    required this.category,
    required this.numero,
    required this.images,
    required this.bio,
     this.following,
 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameboutique': nameboutique,
      'address': address,
      'category': category,
      'numero':numero,
      'images': images,
      'bio': bio,
      'following': following,
   
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['_id'],
      nameboutique: map['nameboutique'] ?? '',
      address: map['address'] ?? '',
      category: map['category'] ?? '',
      numero: map['numero'] ?? '',
      images: List<String>.from(map['images'] ?? []),
      bio: map['bio'] ?? '',
      following: List<String>.from(map['following'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) =>
      Client.fromMap(json.decode(source));
}