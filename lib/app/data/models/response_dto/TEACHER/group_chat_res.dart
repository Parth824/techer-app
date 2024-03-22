// To parse this JSON data, do
//
//     final chatViewResponse = chatViewResponseFromJson(jsonString);

import 'dart:convert';

ChatViewResponse chatViewResponseFromJson(String str) => ChatViewResponse.fromJson(json.decode(str));

String chatViewResponseToJson(ChatViewResponse data) => json.encode(data.toJson());

class ChatViewResponse {
    String? message;
    bool? status;
    int? code;
    Data? data;

    ChatViewResponse({
        this.message,
        this.status,
        this.code,
        this.data,
    });

    factory ChatViewResponse.fromJson(Map<String, dynamic> json) => ChatViewResponse(
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
    String? id;
    String? groupId;
    String? groupName;
    List<Chat>? chat;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.id,
        this.groupId,
        this.groupName,
        this.chat,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        groupId: json["groupId"],
        groupName: json["groupName"],
        chat: json["chat"] == null ? [] : List<Chat>.from(json["chat"]!.map((x) => Chat.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "groupId": groupId,
        "groupName": groupName,
        "chat": chat == null ? [] : List<dynamic>.from(chat!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Chat {
    String? sender;
    String? senderName;
    String? senderImg;
    String? message;
    String? id;

    Chat({
        this.sender,
        this.senderName,
        this.senderImg,
        this.message,
        this.id,
    });

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        sender: json["sender"],
        senderName: json["senderName"],
        senderImg: json["senderImg"],
        message: json["message"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "sender": sender,
        "senderName": senderName,
        "senderImg": senderImg,
        "message": message,
        "_id": id,
    };
}
