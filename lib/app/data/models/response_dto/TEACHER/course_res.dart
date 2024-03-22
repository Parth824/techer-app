// To parse this JSON data, do
//
//     final courseResponse = courseResponseFromJson(jsonString);

import 'dart:convert';

CourseResponse courseResponseFromJson(String str) => CourseResponse.fromJson(json.decode(str));

String courseResponseToJson(CourseResponse data) => json.encode(data.toJson());

class CourseResponse {
    String? message;
    bool? status;
    int? code;
    List<Datum>? data;

    CourseResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory CourseResponse.fromJson(Map<String, dynamic> json) => CourseResponse(
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
    String? uniqueCode;
    String? teacherName;
    String? title;
    String? description;
    List<String>? skill;
    int? term;
    List<Criterion>? criteria;
    int? fees;
    List<String>? candidate;
    int? status;
    String? courseImage;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
        this.id,
        this.uniqueCode,
        this.teacherName,
        this.title,
        this.description,
        this.skill,
        this.term,
        this.criteria,
        this.fees,
        this.candidate,
        this.status,
        this.courseImage,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        uniqueCode: json["unique_code"],
        teacherName: json["teacher_name"],
        title: json["title"],
        description: json["description"],
        skill: json["skill"] == null ? [] : List<String>.from(json["skill"]!.map((x) => x)),
        term: json["term"],
        criteria: json["criteria"] == null ? [] : List<Criterion>.from(json["criteria"]!.map((x) => Criterion.fromJson(x))),
        fees: json["fees"],
        candidate: json["candidate"] == null ? [] : List<String>.from(json["candidate"]!.map((x) => x)),
        status: json["status"],
        courseImage: json["courseImage"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "unique_code": uniqueCode,
        "teacher_name": teacherName,
        "title": title,
        "description": description,
        "skill": skill == null ? [] : List<dynamic>.from(skill!.map((x) => x)),
        "term": term,
        "criteria": criteria == null ? [] : List<dynamic>.from(criteria!.map((x) => x.toJson())),
        "fees": fees,
        "candidate": candidate == null ? [] : List<dynamic>.from(candidate!.map((x) => x)),
        "status": status,
        "courseImage": courseImage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Criterion {
    String? qualification;
    String? age;
    String? communication;
    String? hardware;
    String? id;

    Criterion({
        this.qualification,
        this.age,
        this.communication,
        this.hardware,
        this.id,
    });

    factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        qualification: json["qualification"],
        age: json["age"],
        communication: json["communication"],
        hardware: json["hardware"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "qualification": qualification,
        "age": age,
        "communication": communication,
        "hardware": hardware,
        "_id": id,
    };
}
