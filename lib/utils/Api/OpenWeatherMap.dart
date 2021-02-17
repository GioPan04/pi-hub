import 'package:http/http.dart' as http;
import 'package:pi_hub/models/WeatherData.dart';
import 'dart:convert';

class OpenWeatherMapApi {

  static const String _appKey = String.fromEnvironment("OWM_API_APPID");

  static Future<WeatherData> getWeatherByLocationName(String location, {String units = "metric"}) async {
    Uri uri = Uri.https("api.openweathermap.org", '/data/2.5/weather', {'units': units, 'q': location, 'appid': _appKey});
    http.Response res = await http.get(uri);
    Map<String,dynamic> data = jsonDecode(res.body);
    return WeatherData.fromJSON(data);
  }
}