// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.coverImage,
        this.email,
        this.firstName,
        this.lastName,
        this.location,
        this.userName,
        this.bio,
        this.photoPath,
        this.role,
        this.deviceToken,
        this.active,
        this.id,
    });

    dynamic coverImage;
    String? email;
    String? firstName;
    String? lastName;
    List<dynamic>? location;
    String? userName;
    dynamic bio;
    dynamic photoPath;
    String? role;
    List<dynamic>? deviceToken;
    bool? active;
    String? id;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        coverImage: json["coverImage"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        location: json["location"] == null ? [] : List<dynamic>.from(json["location"]!.map((x) => x)),
        userName: json["userName"],
        bio: json["bio"],
        photoPath: json["photoPath"],
        role: json["role"],
        deviceToken: json["deviceToken"] == null ? [] : List<dynamic>.from(json["deviceToken"]!.map((x) => x)),
        active: json["active"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "coverImage": coverImage,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "userName": userName,
        "bio": bio,
        "photoPath": photoPath,
        "role": role,
        "deviceToken": deviceToken == null ? [] : List<dynamic>.from(deviceToken!.map((x) => x)),
        "active": active,
        "id": id,
    };
}
