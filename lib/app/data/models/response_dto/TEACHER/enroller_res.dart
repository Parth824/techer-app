// To parse this JSON data, do
//
//     final enrolledUser = enrolledUserFromJson(jsonString);

import 'dart:convert';

EnrolledUser enrolledUserFromJson(String str) => EnrolledUser.fromJson(json.decode(str));

String enrolledUserToJson(EnrolledUser data) => json.encode(data.toJson());

class EnrolledUser {
    String? message;
    bool? status;
    int? code;
    List<Datum>? data;

    EnrolledUser({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory EnrolledUser.fromJson(Map<String, dynamic> json) => EnrolledUser(
        message: json["message"],
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "code": code,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? profile;
    String? firstName;
    String? lastName;
    String? email;
    String? password;
    String? gender;
    dynamic phoneCode;
    String? mobile;
    int? whatsApp;
    String? city;
    String? secondCity;
    dynamic motherTongue;
    int? language;
    String? linkedinProfile;
    String? aboutYourself;
    String? wallet;
    String? token;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.profile,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.gender,
        this.phoneCode,
        this.mobile,
        this.whatsApp,
        this.city,
        this.secondCity,
        this.motherTongue,
        this.language,
        this.linkedinProfile,
        this.aboutYourself,
        this.wallet,
        this.token,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        profile: json["profile"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        phoneCode: json["phone_code"],
        mobile: json["mobile"],
        whatsApp: json["whats_app"],
        city: json["city"],
        secondCity: json["second_city"],
        motherTongue: json["mother_tongue"],
        language: json["language"],
        linkedinProfile: json["linkedin_profile"],
        aboutYourself: json["about_yourself"],
        wallet: json["wallet"],
        token: json["token"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "profile": profile,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "gender": gender,
        "phone_code": phoneCode,
        "mobile": mobile,
        "whats_app": whatsApp,
        "city": city,
        "second_city": secondCity,
        "mother_tongue": motherTongue,
        "language": language,
        "linkedin_profile": linkedinProfile,
        "about_yourself": aboutYourself,
        "wallet": wallet,
        "token": token,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
