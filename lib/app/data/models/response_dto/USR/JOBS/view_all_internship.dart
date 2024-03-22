// import 'dart:convert';

// import 'package:collection/collection.dart';

// class AllInternShipDetailsRes {
//   final String? message;
//   final bool? status;
//   final int? code;
//   final List<InternShipDetailsData>? data;
//   AllInternShipDetailsRes({
//     this.message,
//     this.status,
//     this.code,
//     this.data,
//   });

//   AllInternShipDetailsRes copyWith({
//     String? message,
//     bool? status,
//     int? code,
//     List<InternShipDetailsData>? data,
//   }) {
//     return AllInternShipDetailsRes(
//       message: message ?? this.message,
//       status: status ?? this.status,
//       code: code ?? this.code,
//       data: data ?? this.data,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'message': message,
//       'status': status,
//       'code': code,
//       'data': data?.map((x) => x.toMap()).toList(),
//     };
//   }

//   factory AllInternShipDetailsRes.fromMap(Map<String, dynamic> map) {
//     return AllInternShipDetailsRes(
//       message: map['message'] as String,
//       status: map['status'] as bool,
//       code: map['code'].toInt() as int,
//       data: List<InternShipDetailsData>.from(
//         (map['data'] as List<dynamic>).map<InternShipDetailsData>(
//           (x) => InternShipDetailsData.fromMap(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AllInternShipDetailsRes.fromJson(String source) =>
//       AllInternShipDetailsRes.fromMap(
//           json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'AllJInternShipDetailsRes(message: $message, status: $status, code: $code, data: $data)';
//   }

//   @override
//   bool operator ==(covariant AllInternShipDetailsRes other) {
//     if (identical(this, other)) return true;
//     final listEquals = const DeepCollectionEquality().equals;

//     return other.message == message &&
//         other.status == status &&
//         other.code == code &&
//         listEquals(other.data, data);
//   }

//   @override
//   int get hashCode {
//     return message.hashCode ^ status.hashCode ^ code.hashCode ^ data.hashCode;
//   }
// }

// class InternShipDetailsData {
//   final String id;
//   final String company_id;
//   final String company_name;
//   final int type;
//   final int time;
//   final String address;
//   final int vacancy;
//   final String start_date;
//   final int duration;
//   final String description;
//   final String technology;
//   final String stipend;
//   final int stipend_salary;
//   final List<String> perks;
//   final List<String> skills;
//   final int active;
//   final String createdAt;
//   final String updatedAt;
//   final int v;
//   InternShipDetailsData({
//     required this.id,
//     required this.company_id,
//     required this.company_name,
//     required this.type,
//     required this.time,
//     required this.address,
//     required this.vacancy,
//     required this.start_date,
//     required this.duration,
//     required this.description,
//     required this.technology,
//     required this.stipend,
//     required this.stipend_salary,
//     required this.perks,
//     required this.skills,
//     required this.active,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   InternShipDetailsData copyWith({
//     String? id,
//     String? company_id,
//     String? company_name,
//     int? type,
//     int? time,
//     String? address,
//     int? vacancy,
//     String? start_date,
//     int? duration,
//     String? description,
//     String? technology,
//     String? stipend,
//     int? stipend_salary,
//     List<String>? perks,
//     List<String>? skills,
//     int? active,
//     String? createdAt,
//     String? updatedAt,
//     int? v,
//   }) {
//     return InternShipDetailsData(
//       id: id ?? this.id,
//       company_id: company_id ?? this.company_id,
//       company_name: company_name ?? this.company_name,
//       type: type ?? this.type,
//       time: time ?? this.time,
//       address: address ?? this.address,
//       vacancy: vacancy ?? this.vacancy,
//       start_date: start_date ?? this.start_date,
//       duration: duration ?? this.duration,
//       description: description ?? this.description,
//       technology: technology ?? this.technology,
//       stipend: stipend ?? this.stipend,
//       stipend_salary: stipend_salary ?? this.stipend_salary,
//       perks: perks ?? this.perks,
//       skills: skills ?? this.skills,
//       active: active ?? this.active,
//       createdAt: createdAt ?? this.createdAt,
//       updatedAt: updatedAt ?? this.updatedAt,
//       v: v ?? this.v,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       '_id': id,
//       'company_id': company_id,
//       'company_name': company_name,
//       'type': type,
//       'time': time,
//       'address': address,
//       'vacancy': vacancy,
//       'start_date': start_date,
//       'duration': duration,
//       'description': description,
//       'technology': technology,
//       'stipend': stipend,
//       'stipend_salary': stipend_salary,
//       'perks': perks,
//       'skills': skills,
//       'active': active,
//       'createdAt': createdAt,
//       'updatedAt': updatedAt,
//       '__v': v,
//     };
//   }

//   factory InternShipDetailsData.fromMap(Map<String, dynamic> map) {
//     return InternShipDetailsData(
//       id: map['_id'] as String,
//       company_id: map['company_id'] as String,
//       company_name: map['company_name'] as String,
//       type: map['type'].toInt() as int,
//       time: map['time'].toInt() as int,
//       address: map['address'] as String,
//       vacancy: map['vacancy'].toInt() as int,
//       start_date: map['start_date'] as String,
//       duration: map['duration'].toInt() as int,
//       description: map['description'] as String,
//       technology: map['technology'] as String,
//       stipend: map['stipend'] as String,
//       stipend_salary: map['stipend_salary'].toInt() as int,
//       perks: List<String>.from((map['perks'] as List<String>)),
//       skills: List<String>.from((map['skills'] as List<String>)),
//       active: map['active'].toInt() as int,
//       createdAt: map['createdAt'] as String,
//       updatedAt: map['updatedAt'] as String,
//       v: map['__v'].toInt() as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory InternShipDetailsData.fromJson(String source) =>
//       InternShipDetailsData.fromMap(
//           json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Data(id: $id, company_id: $company_id, company_name: $company_name, type: $type, time: $time, address: $address, vacancy: $vacancy, start_date: $start_date, duration: $duration, description: $description, technology: $technology, stipend: $stipend, stipend_salary: $stipend_salary, perks: $perks, skills: $skills, active: $active, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
//   }

//   @override
//   bool operator ==(covariant InternShipDetailsData other) {
//     if (identical(this, other)) return true;
//     final listEquals = const DeepCollectionEquality().equals;

//     return other.id == id &&
//         other.company_id == company_id &&
//         other.company_name == company_name &&
//         other.type == type &&
//         other.time == time &&
//         other.address == address &&
//         other.vacancy == vacancy &&
//         other.start_date == start_date &&
//         other.duration == duration &&
//         other.description == description &&
//         other.technology == technology &&
//         other.stipend == stipend &&
//         other.stipend_salary == stipend_salary &&
//         listEquals(other.perks, perks) &&
//         listEquals(other.skills, skills) &&
//         other.active == active &&
//         other.createdAt == createdAt &&
//         other.updatedAt == updatedAt &&
//         other.v == v;
//   }

//   @override
//   int get hashCode {
//     return id.hashCode ^
//         company_id.hashCode ^
//         company_name.hashCode ^
//         type.hashCode ^
//         time.hashCode ^
//         address.hashCode ^
//         vacancy.hashCode ^
//         start_date.hashCode ^
//         duration.hashCode ^
//         description.hashCode ^
//         technology.hashCode ^
//         stipend.hashCode ^
//         stipend_salary.hashCode ^
//         perks.hashCode ^
//         skills.hashCode ^
//         active.hashCode ^
//         createdAt.hashCode ^
//         updatedAt.hashCode ^
//         v.hashCode;
//   }
// }

// To parse this JSON data, do
//
//     final allInternShipDetailsRes = allInternShipDetailsResFromJson(jsonString);

import 'dart:convert';

String allInternShipDetailsResToJson(AllInternShipDetailsRes data) =>
    json.encode(data.toJson());

class AllInternShipDetailsRes {
  String? message;
  bool? status;
  int? code;
  List<InternShipDetailsData>? data;

  AllInternShipDetailsRes({
    this.message,
    this.status,
    this.code,
    this.data,
  });

  factory AllInternShipDetailsRes.fromJson(Map<String, dynamic> json) =>
      AllInternShipDetailsRes(
        message: json["message"],
        status: json["status"],
        code: json["code"],
        data: List<InternShipDetailsData>.from(
            json["data"].map((x) => InternShipDetailsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class InternShipDetailsData {
  String id;
  String companyId;
  String companyName;
  int type;
  int time;
  String address;
  int vacancy;
  DateTime startDate;
  int duration;
  String description;
  String technology;
  String stipend;
  int stipendSalary;
  List<String> perks;
  List<String> skills;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  InternShipDetailsData({
    required this.id,
    required this.companyId,
    required this.companyName,
    required this.type,
    required this.time,
    required this.address,
    required this.vacancy,
    required this.startDate,
    required this.duration,
    required this.description,
    required this.technology,
    required this.stipend,
    required this.stipendSalary,
    required this.perks,
    required this.skills,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory InternShipDetailsData.fromJson(Map<String, dynamic> json) =>
      InternShipDetailsData(
        id: json["_id"],
        companyId: json["company_id"],
        companyName: json["company_name"],
        type: json["type"],
        time: json["time"],
        address: json["address"],
        vacancy: json["vacancy"],
        startDate: DateTime.parse(json["start_date"]),
        duration: json["duration"],
        description: json["description"],
        technology: json["technology"],
        stipend: json["stipend"],
        stipendSalary: json["stipend_salary"],
        perks: List<String>.from(json["perks"].map((x) => x)),
        skills: List<String>.from(json["skills"].map((x) => x)),
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "company_id": companyId,
        "company_name": companyName,
        "type": type,
        "time": time,
        "address": address,
        "vacancy": vacancy,
        "start_date": startDate.toIso8601String(),
        "duration": duration,
        "description": description,
        "technology": technology,
        "stipend": stipend,
        "stipend_salary": stipendSalary,
        "perks": List<dynamic>.from(perks.map((x) => x)),
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "active": active,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
