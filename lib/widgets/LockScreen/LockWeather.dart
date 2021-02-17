import 'package:flutter/material.dart';
import 'package:pi_hub/repositories/WeatherProvider.dart';
import 'package:provider/provider.dart';

class LockWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Consumer<WeatherProvider>(
        builder: (context, data, _) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(data.weather.localizedTemp, style: TextStyle(fontSize: 40),),
            Text(data.weather.description, style: TextStyle(fontSize: 20),),
            Image.network(data.weather.iconUrl),
          ],
        ),
      ),
    );
  }
}