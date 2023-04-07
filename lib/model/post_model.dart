import 'dart:convert';
import 'package:get/get.dart';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.to,
    this.user,
    this.category,
    this.body,
    this.images,
    this.status,
    this.location,
    this.likes,
    this.comments,
    this.id,
  });

  dynamic to;
  User? user;
  String? category;
  String? body;
  List<dynamic>? images;
  String? status;
  String? location;
  List<dynamic>? likes;
  List<dynamic>? comments;
  String? id;
  RxBool like = false.obs;
  RxBool comment = false.obs;
  RxBool save = false.obs;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        to: json["to"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        category: json["category"],
        body: json["body"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        status: json["status"],
        location: json["location"],
        likes: json["likes"] == null
            ? []
            : List<dynamic>.from(json["likes"]!.map((x) => x)),
        comments: json["comments"] == null
            ? []
            : List<dynamic>.from(json["comments"]!.map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "to": to,
        "user": user?.toJson(),
        "category": category,
        "body": body,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "status": status,
        "location": location,
        "likes": likes == null ? [] : List<dynamic>.from(likes!.map((x) => x)),
        "comments":
            comments == null ? [] : List<dynamic>.from(comments!.map((x) => x)),
        "id": id,
      };
}

class User {
  User({
    this.otp,
    this.deviceToken,
    this.email,
    this.firstName,
    this.lastName,
    this.location,
    this.userName,
    this.bio,
    this.photoPath,
    this.role,
    this.active,
    this.id,
  });

  Otp? otp;
  List<dynamic>? deviceToken;
  String? email;
  String? firstName;
  String? lastName;
  List<dynamic>? location;
  String? userName;
  dynamic bio;
  String? photoPath;
  String? role;
  bool? active;
  String? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        otp: json["OTP"] == null ? null : Otp.fromJson(json["OTP"]),
        deviceToken: json["deviceToken"] == null
            ? []
            : List<dynamic>.from(json["deviceToken"]!.map((x) => x)),
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        location: json["location"] == null
            ? []
            : List<dynamic>.from(json["location"]!.map((x) => x)),
        userName: json["userName"],
        bio: json["bio"],
        photoPath: json["photoPath"],
        role: json["role"],
        active: json["active"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "OTP": otp?.toJson(),
        "deviceToken": deviceToken == null
            ? []
            : List<dynamic>.from(deviceToken!.map((x) => x)),
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "location":
            location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "userName": userName,
        "bio": bio,
        "photoPath": photoPath,
        "role": role,
        "active": active,
        "id": id,
      };
}

class Otp {
  Otp({
    this.key,
  });

  dynamic key;

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        key: json["key"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
      };
}
