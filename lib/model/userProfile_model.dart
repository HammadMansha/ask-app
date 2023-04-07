// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
    UserProfile({
        this.notification,
        this.user,
        this.following,
        this.followers,
        this.friends,
        this.freindRequestSent,
        this.freindRequestRecieved,
        this.bookmarks,
        this.id,
    });

    Notification? notification;
    User? user;
    List<User>? following;
    List<User>? followers;
    List<dynamic>? friends;
    List<dynamic>? freindRequestSent;
    List<dynamic>? freindRequestRecieved;
    List<String>? bookmarks;
    String? id;

    factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        notification: json["notification"] == null ? null : Notification.fromJson(json["notification"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        following: json["following"] == null ? [] : List<User>.from(json["following"]!.map((x) => User.fromJson(x))),
        followers: json["followers"] == null ? [] : List<User>.from(json["followers"]!.map((x) => User.fromJson(x))),
        friends: json["friends"] == null ? [] : List<dynamic>.from(json["friends"]!.map((x) => x)),
        freindRequestSent: json["freindRequestSent"] == null ? [] : List<dynamic>.from(json["freindRequestSent"]!.map((x) => x)),
        freindRequestRecieved: json["freindRequestRecieved"] == null ? [] : List<dynamic>.from(json["freindRequestRecieved"]!.map((x) => x)),
        bookmarks: json["bookmarks"] == null ? [] : List<String>.from(json["bookmarks"]!.map((x) => x)),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "notification": notification?.toJson(),
        "user": user?.toJson(),
        "following": following == null ? [] : List<dynamic>.from(following!.map((x) => x.toJson())),
        "followers": followers == null ? [] : List<dynamic>.from(followers!.map((x) => x)),
        "friends": friends == null ? [] : List<dynamic>.from(friends!.map((x) => x)),
        "freindRequestSent": freindRequestSent == null ? [] : List<dynamic>.from(freindRequestSent!.map((x) => x)),
        "freindRequestRecieved": freindRequestRecieved == null ? [] : List<dynamic>.from(freindRequestRecieved!.map((x) => x)),
        "bookmarks": bookmarks == null ? [] : List<dynamic>.from(bookmarks!.map((x) => x)),
        "id": id,
    };
}

class User {
    User({
        this.coverImage,
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

    String? coverImage;
    List<dynamic>? deviceToken;
    String? email;
    String? firstName;
    String? lastName;
    List<dynamic>? location;
    String? userName;
    String? bio;
    String? photoPath;
    String? role;
    bool? active;
    String? id;

    factory User.fromJson(Map<String, dynamic> json) => User(
        coverImage: json["coverImage"],
        deviceToken: json["deviceToken"] == null ? [] : List<dynamic>.from(json["deviceToken"]!.map((x) => x)),
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        location: json["location"] == null ? [] : List<dynamic>.from(json["location"]!.map((x) => x)),
        userName: json["userName"],
        bio: json["bio"],
        photoPath: json["photoPath"],
        role: json["role"],
        active: json["active"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "coverImage": coverImage,
        "deviceToken": deviceToken == null ? [] : List<dynamic>.from(deviceToken!.map((x) => x)),
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "userName": userName,
        "bio": bio,
        "photoPath": photoPath,
        "role": role,
        "active": active,
        "id": id,
    };
}

class Notification {
    Notification({
        this.newQuestion,
        this.newLike,
        this.newAnswer,
        this.newMention,
        this.newFollower,
    });

    bool? newQuestion;
    bool? newLike;
    bool? newAnswer;
    bool? newMention;
    bool? newFollower;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        newQuestion: json["newQuestion"],
        newLike: json["newLike"],
        newAnswer: json["newAnswer"],
        newMention: json["newMention"],
        newFollower: json["newFollower"],
    );

    Map<String, dynamic> toJson() => {
        "newQuestion": newQuestion,
        "newLike": newLike,
        "newAnswer": newAnswer,
        "newMention": newMention,
        "newFollower": newFollower,
    };
}
