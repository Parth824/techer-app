// To parse this JSON data, do
//
//     final videoDeleteResponse = videoDeleteResponseFromJson(jsonString);

import 'dart:convert';

VideoDeleteResponse videoDeleteResponseFromJson(String str) => VideoDeleteResponse.fromJson(json.decode(str));

String videoDeleteResponseToJson(VideoDeleteResponse data) => json.encode(data.toJson());

class VideoDeleteResponse {
    String? message;
    bool? status;
    int? code;

    VideoDeleteResponse({
        this.message,
        this.status,
        this.code,
    });

    factory VideoDeleteResponse.fromJson(Map<String, dynamic> json) => VideoDeleteResponse(
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
