// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

class AssignmentRequestDto {
  File? image;
  AssignmentRequestDto({
    this.image
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image
    };
  }
}