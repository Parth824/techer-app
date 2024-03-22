
// To parse this JSON data, do
//
//     final assignmentResponse = assignmentResponseFromJson(jsonString);

import 'dart:convert';

AssignmentResponse assignmentResponseFromJson(String str) => AssignmentResponse.fromJson(json.decode(str));

String assignmentResponseToJson(AssignmentResponse data) => json.encode(data.toJson());

class AssignmentResponse {
    String? message;
    bool? status;
    int? code;
    List<Datum>? data;

    AssignmentResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory AssignmentResponse.fromJson(Map<String, dynamic> json) => AssignmentResponse(
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
    String? teacherId;
    List<Image>? image;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.courseId,
        this.teacherId,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        courseId: json["course_id"],
        teacherId: json["teacher_id"],
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "course_id": courseId,
        "teacher_id": teacherId,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Image {
    String? res;

    Image({
        this.res,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        res: json["res"],
    );

    Map<String, dynamic> toJson() => {
        "res": res,
    };
}