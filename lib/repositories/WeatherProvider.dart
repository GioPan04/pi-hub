import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:pi_hub/models/WeatherData.dart';
import 'package:pi_hub/utils/Api/OpenWeatherMap.dart';

class WeatherProvider with ChangeNotifier {
  
  WeatherData _weather;
  WeatherData get weather => _weather;

  Future<void> updateWeather(String location) async {
    try {
      WeatherData data = await OpenWeatherMapApi.getWeatherByLocationName(location);
      _weather = data;
      notifyListeners();
    } catch (e) {
      debugPrint("An error occuring during fetch of the weather");
      debugPrint(e.toString());
    }
  }

  void init(String location) {
    updateWeather(location);
    Timer.periodic(Duration(minutes: 15), (_) => updateWeather(location));
  }

}