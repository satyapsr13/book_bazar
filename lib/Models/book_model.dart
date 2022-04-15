import 'dart:convert';

class BookModel {
  String id;
  String title;
  String subtitle;
  String author;
  String description;
  String price;
  String address;
  String bookImageUrl;
  BookModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.description,
    required this.price,
    required this.address,
    required this.bookImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'author': author,
      'description': description,
      'price': price,
      'address': address,
      'bookImageUrl': bookImageUrl,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      address: map['address'] ?? '',
      bookImageUrl: map['bookImageUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source));
}
