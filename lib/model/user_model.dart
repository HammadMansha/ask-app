

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.otp,
        this.email,
        this.firstName,
        this.lastName,
        this.location,
        this.userName,
        this.bio,
        this.photoPath,
        this.role,
        this.active,
        this.deviceToken,
        this.id,
    });

    Otp? otp;
    String? email;
    String? firstName;
    String? lastName;
    List<dynamic>? location;
    String? userName;
    dynamic bio;
    String? photoPath;
    String? role;
    bool? active;
    List<String>? deviceToken;
    String? id;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        otp: json["OTP"] == null ? null : Otp.fromJson(json["OTP"]),
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        location: json["location"] == null ? [] : List<dynamic>.from(json["location"]!.map((x) => x)),
        userName: json["userName"],
        bio: json["bio"],
        photoPath: json["photoPath"],
        role: json["role"],
        active: json["active"],
        deviceToken: json["deviceToken"] == null ? [] : List<String>.from(json["deviceToken"]!.map((x) => x)),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "OTP": otp?.toJson(),
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "userName": userName,
        "bio": bio,
        "photoPath": photoPath,
        "role": role,
        "active": active,
        "deviceToken": deviceToken == null ? [] : List<dynamic>.from(deviceToken!.map((x) => x)),
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
