// To parse this JSON data, do
//
//     final startLectureResponse = startLectureResponseFromJson(jsonString);

import 'dart:convert';

StartLectureResponse startLectureResponseFromJson(String str) => StartLectureResponse.fromJson(json.decode(str));

String startLectureResponseToJson(StartLectureResponse data) => json.encode(data.toJson());

class StartLectureResponse {
    String? message;
    int? code;
    bool? status;
    List<Datum>? data;

    StartLectureResponse({
        this.message,
        this.code,
        this.status,
        this.data,
    });

    factory StartLectureResponse.fromJson(Map<String, dynamic> json) => StartLectureResponse(
        message: json["message"],
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? userId;

    Datum({
        this.userId,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
    };
}
