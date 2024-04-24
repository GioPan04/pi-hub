import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hub/modules/background/models/image.dart';
import 'package:pi_hub/types/json.dart';

class RandomBackgroundService {
  final Dio http;

  RandomBackgroundService({required Dio client}) : http = client;

  Future<Image> randomImage(String seed) async {
    final res = await http.get<Uint8List>(
      "https://picsum.photos/seed/$seed/1920/1080",
      options: Options(responseType: ResponseType.bytes),
    );
    final id = res.headers['picsum-id']!.first;

    final info = await http.get<Json>("https://picsum.photos/id/$id/info");

    return Image(
      id: id,
      author: info.data!['author'],
      photo: res.data!,
    );
  }
}
