// To parse this JSON data, do
//
//     final videoResponse = videoResponseFromJson(jsonString);

import 'dart:convert';

VideoResponse videoResponseFromJson(String str) => VideoResponse.fromJson(json.decode(str));

String videoResponseToJson(VideoResponse data) => json.encode(data.toJson());

class VideoResponse {
    String? message;
    bool? status;
    int? code;
    List<Datum>? data;

    VideoResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory VideoResponse.fromJson(Map<String, dynamic> json) => VideoResponse(
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
    List<Video>? video;
    String? title;
    String? desc;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.courseId,
        this.teacherId,
        this.video,
        this.title,
        this.desc,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        courseId: json["course_id"],
        teacherId: json["teacher_id"],
        video: json["video"] == null ? [] : List<Video>.from(json["video"]!.map((x) => Video.fromJson(x))),
        title: json["title"],
        desc: json["desc"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "course_id": courseId,
        "teacher_id": teacherId,
        "video": video == null ? [] : List<dynamic>.from(video!.map((x) => x.toJson())),
        "title": title,
        "desc": desc,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Video {
    String? res;

    Video({
        this.res,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        res: json["res"],
    );

    Map<String, dynamic> toJson() => {
        "res": res,
    };
}
