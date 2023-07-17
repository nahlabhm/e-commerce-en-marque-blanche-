
import 'dart:convert';
class Comment {
  final String text;
  final DateTime createdAt;

  Comment({
    required this.text,
    required this.createdAt,
  });

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      text: map['text'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] ?? 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}