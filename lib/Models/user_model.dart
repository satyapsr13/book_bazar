import 'dart:convert';

class UserModel {
  String displayName;
  String email;
  String id;
  String photoUrl;
  UserModel({
    required this.displayName,
    required this.email,
    required this.id,
    required this.photoUrl,
  });



  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'id': id,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      id: map['id'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
