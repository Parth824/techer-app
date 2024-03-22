// To parse this JSON data, do
//
//     final assignmentInsertResponse = assignmentInsertResponseFromJson(jsonString);

import 'dart:convert';

AssignmentInsertResponse assignmentInsertResponseFromJson(String str) => AssignmentInsertResponse.fromJson(json.decode(str));

String assignmentInsertResponseToJson(AssignmentInsertResponse data) => json.encode(data.toJson());

class AssignmentInsertResponse {
    String? message;
    bool? status;
    int? code;
    Data? data;

    AssignmentInsertResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory AssignmentInsertResponse.fromJson(Map<String, dynamic> json) => AssignmentInsertResponse(
        message: json["message"],
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "code": code,
        "data": data?.toJson(),
    };
}

class Data {
    String? courseId;
    String? teacherId;
    List<Image>? image;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.courseId,
        this.teacherId,
        this.image,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        courseId: json["course_id"],
        teacherId: json["teacher_id"],
        image: json["image"] == null ? [] : List<Image>.from(json["image"]!.map((x) => Image.fromJson(x))),
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "teacher_id": teacherId,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
        "_id": id,
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
