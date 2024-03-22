
// To parse this JSON data, do
//
//     final assingmentDeleteResponse = assingmentDeleteResponseFromJson(jsonString);

import 'dart:convert';

AssingmentDeleteResponse assingmentDeleteResponseFromJson(String str) => AssingmentDeleteResponse.fromJson(json.decode(str));

String assingmentDeleteResponseToJson(AssingmentDeleteResponse data) => json.encode(data.toJson());

class AssingmentDeleteResponse {
    String? message;
    bool? status;
    int? code;

    AssingmentDeleteResponse({
        this.message,
        this.status,
        this.code,
    });

    factory AssingmentDeleteResponse.fromJson(Map<String, dynamic> json) => AssingmentDeleteResponse(
        message: json["message"],
        status: json["status"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "code": code,
    };
}
