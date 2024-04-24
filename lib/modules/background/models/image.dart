import 'package:flutter/foundation.dart';

class Image {
  // See https://picsum.photos/seed/picsum/info

  final String id;
  final String author;
  final Uint8List photo;

  Image({
    required this.id,
    required this.author,
    required this.photo,
  });
}
