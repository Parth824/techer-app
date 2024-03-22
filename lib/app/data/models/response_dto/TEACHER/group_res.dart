// To parse this JSON data, do
//
//     final gruopResponse = gruopResponseFromJson(jsonString);

import 'dart:convert';

GruopResponse gruopResponseFromJson(String str) => GruopResponse.fromJson(json.decode(str));

String gruopResponseToJson(GruopResponse data) => json.encode(data.toJson());

class GruopResponse {
    String? message;
    bool? status;
    int? code;
    List<Datum>? data;

    GruopResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory GruopResponse.fromJson(Map<String, dynamic> json) => GruopResponse(
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
    String? userId;
    String? courseId;
    String? groupImg;
    String? groupName;
    String? groupDesc;
    int? groupMember;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.userId,
        this.courseId,
        this.groupImg,
        this.groupName,
        this.groupDesc,
        this.groupMember,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        userId: json["user_id"],
        courseId: json["course_id"],
        groupImg: json["group_img"],
        groupName: json["group_name"],
        groupDesc: json["group_desc"],
        groupMember: json["group_member"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "course_id": courseId,
        "group_img": groupImg,
        "group_name": groupName,
        "group_desc": groupDesc,
        "group_member": groupMember,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
