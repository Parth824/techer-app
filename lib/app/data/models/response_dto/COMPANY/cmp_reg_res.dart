// To parse this JSON data, do
//
//     final cmpRegisterResModel = cmpRegisterResModelFromJson(jsonString);

import 'dart:convert';

CmpRegisterResModel cmpRegisterResModelFromJson(String str) =>
    CmpRegisterResModel.fromJson(json.decode(str));

String cmpRegisterResModelToJson(CmpRegisterResModel data) =>
    json.encode(data.toJson());

class CmpRegisterResModel {
  String? message;
  bool? status;
  int? code;
  Data? data;

  CmpRegisterResModel({
    this.message,
    this.status,
    this.code,
    this.data,
  });

  factory CmpRegisterResModel.fromJson(Map<String, dynamic> json) =>
      CmpRegisterResModel(
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
  String? name;
  String? image;
  String? type;
  String? industryType;
  int? noOfEmp;
  String? yourName;
  String? yourRole;
  String? email;
  String? mobile;
  int? whatsApp;
  String? password;
  String? wallet;
  String? city;
  String? state;
  String? country;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.name,
    this.image,
    this.type,
    this.industryType,
    this.noOfEmp,
    this.yourName,
    this.yourRole,
    this.email,
    this.mobile,
    this.whatsApp,
    this.password,
    this.wallet,
    this.city,
    this.state,
    this.country,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        image: json["image"],
        type: json["type"],
        industryType: json["industry_type"],
        noOfEmp: json["no_of_emp"],
        yourName: json["your_name"],
        yourRole: json["your_role"],
        email: json["email"],
        mobile: json["mobile"],
        whatsApp: json["whats_app"],
        password: json["password"],
        wallet: json["wallet"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "type": type,
        "industry_type": industryType,
        "no_of_emp": noOfEmp,
        "your_name": yourName,
        "your_role": yourRole,
        "email": email,
        "mobile": mobile,
        "whats_app": whatsApp,
        "password": password,
        "wallet": wallet,
        "city": city,
        "state": state,
        "country": country,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
