import 'package:flutter/material.dart';
import 'package:pi_hub/models/WeatherData.dart';
import 'package:pi_hub/repositories/WeatherProvider.dart';
import 'package:provider/provider.dart';

class LockWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: Consumer<WeatherProvider>(
        builder: (context, state, _) {
          final WeatherData? data = state.weather;
          if(data == null) return Container();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(data.localizedTemp, style: TextStyle(fontSize: 40),),
              Text(data.description, style: TextStyle(fontSize: 20),),
              Image.network(data.iconUrl),
            ],
          );
        },
      ),
    );
  }
}