import 'package:http/http.dart' as http;

class UnsplashApi {

  /// Returns a random image from unsplash
  static Future<List<int>> randomImage({int? width, int? height, int? collection}) async {
    // If no params are passed, use default ones
    width ??= 1920;
    height ??= 1080;
    collection ??= 1053828;

    Uri uri = Uri.https("source.unsplash.com", '/collection/$collection/${width}x$height');
    http.Response res = await http.get(uri);
    return res.bodyBytes;
  }
}