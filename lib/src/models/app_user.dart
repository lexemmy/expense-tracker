// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
    AppUser({
        this.user,
        this.token,
    });

    User user;
    String token;

    factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt,
        this.userName,
        this.userEmail,
        this.userPhone,
        this.profileVisibility,
        this.token,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic userName;
    dynamic userEmail;
    dynamic userPhone;
    int profileVisibility;
    String token;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["user"]["id"],
        name: json["user"]["name"],
        email: json["user"]["email"],
        emailVerifiedAt: json["user"]["email_verified_at"],
        createdAt: DateTime.parse(json["user"]["created_at"]),
        updatedAt: DateTime.parse(json["user"]["updated_at"]),
        userName: json["user"]["user_name"],
        userEmail: json["user"]["user_email"],
        userPhone: json["user"]["user_phone"],
        profileVisibility: json["user"]["profile_visibility"],
        token: json["token"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_name": userName,
        "user_email": userEmail,
        "user_phone": userPhone,
        "profile_visibility": profileVisibility,
    };
}
