import 'message_model.dart';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? cover;
  String? bio;
  String? image;
  MessageModel? lastMessage; // Add this line

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.cover,
    this.bio,
    this.image,
    this.lastMessage
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    cover = json['cover'];
    bio = json['bio'];
    image = json['image'];
    lastMessage=json['lastMessages'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'cover': cover,
      'bio': bio,
      'image': image,
      'lastMessage':lastMessage
    };
  }
}
