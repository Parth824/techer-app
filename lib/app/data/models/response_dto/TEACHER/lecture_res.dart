// To parse this JSON data, do
//
//     final lectureResponse = lectureResponseFromJson(jsonString);

import 'dart:convert';

LectureResponse lectureResponseFromJson(String str) => LectureResponse.fromJson(json.decode(str));

String lectureResponseToJson(LectureResponse data) => json.encode(data.toJson());

class LectureResponse {
    String? message;
    bool? status;
    int? code;
    List<Datum>? data;

    LectureResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory LectureResponse.fromJson(Map<String, dynamic> json) => LectureResponse(
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
    String? courseId;
    String? courseName;
    String? startDate;
    String? endDate;
    List<String>? day;
    String? startTime;
    String? endTime;
    String? timezone;
    int? slot;
    String? code;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.courseId,
        this.courseName,
        this.startDate,
        this.endDate,
        this.day,
        this.startTime,
        this.endTime,
        this.timezone,
        this.slot,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        courseId: json["course_id"],
        courseName: json["course_name"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        day: json["day"] == null ? [] : List<String>.from(json["day"]!.map((x) => x)),
        startTime: json["start_time"],
        endTime: json["end_time"],
        timezone: json["timezone"],
        slot: json["slot"],
        code: json["code"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "course_id": courseId,
        "course_name": courseName,
        "start_date": startDate,
        "end_date": endDate,
        "day": day == null ? [] : List<dynamic>.from(day!.map((x) => x)),
        "start_time": startTime,
        "end_time": endTime,
        "timezone": timezone,
        "slot": slot,
        "code": code,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
