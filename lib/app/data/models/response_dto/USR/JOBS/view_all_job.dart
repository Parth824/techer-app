import 'dart:convert';

import 'package:collection/collection.dart';

import 'data.dart';

class AllJobDetails {
  final String? message;
  final bool? status;
  final int? code;
  final List<JobDetailData>? data;
  AllJobDetails({
    this.message,
    this.status,
    this.code,
    this.data,
  });

  AllJobDetails copyWith({
    String? message,
    bool? status,
    int? code,
    List<JobDetailData>? data,
  }) {
    return AllJobDetails(
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
      'data': data?.map((x) => x.toMap()).toList(),
    };
  }

  factory AllJobDetails.fromMap(Map<String, dynamic> map) {
    return AllJobDetails(
      message: map['message'] as String,
      status: map['status'] as bool,
      code: map['code'].toInt() as int,
      data: List<JobDetailData>.from(
        (map['data'] as List<dynamic>).map<JobDetailData>(
          (x) => JobDetailData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AllJobDetails.fromJson(String source) =>
      AllJobDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AllJobDetails(message: $message, status: $status, code: $code, data: $data)';
  }

  @override
  bool operator ==(covariant AllJobDetails other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.message == message &&
        other.status == status &&
        other.code == code &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return message.hashCode ^ status.hashCode ^ code.hashCode ^ data.hashCode;
  }
}
