import 'dart:convert';

import 'profile_data.dart';

class UserProfileRes {
  final String message;
  final bool status;
  final int code;
  final ProfileData data;
  UserProfileRes({
    required this.message,
    required this.status,
    required this.code,
    required this.data,
  });

  UserProfileRes copyWith({
    String? message,
    bool? status,
    int? code,
    ProfileData? data,
  }) {
    return UserProfileRes(
      message: message ?? this.message,
      status: status ?? this.status,
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'code': code,
      'data': data.toMap(),
    };
  }

  factory UserProfileRes.fromMap(Map<String, dynamic> map) {
    return UserProfileRes(
      message: map['message'] as String,
      status: map['status'] as bool,
      code: map['code'].toInt() as int,
      data: ProfileData.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileRes.fromJson(String source) =>
      UserProfileRes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserProfileRes(message: $message, status: $status, code: $code, data: $data)';
  }

}
