import 'package:flutter/foundation.dart';

class Gallery {
  final String type;

  final Uint8List thumbnailBytes;

  final Uint8List bytes;

  final DateTime dateTime;

  final String localPath;

  final String title;

  final String description;

  Gallery({
    required this.title,
    required this.description,
    required this.type,
    required this.bytes,
    required this.dateTime,
    required this.localPath,
    required this.thumbnailBytes,
  });
}
