// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String? message;
    bool? status;
    int? code;
    String? teacherId;
    String? teacherProfile;
    String? token;
    String? uniqueCode;

    LoginResponse({
        this.message,
        this.status,
        this.code,
        this.teacherId,
        this.teacherProfile,
        this.token,
        this.uniqueCode,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        status: json["status"],
        code: json["code"],
        teacherId: json["teacher_id"],
        teacherProfile: json["teacher_profile"],
        token: json["token"],
        uniqueCode: json["unique_code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "code": code,
        "teacher_id": teacherId,
        "teacher_profile": teacherProfile,
        "token": token,
        "unique_code": uniqueCode,
    };
}
