import 'package:flutter/material.dart';
import 'package:pi_hub/repositories/PeriodicImageProvider.dart';
import 'package:pi_hub/repositories/TimeProvider.dart';
import 'package:pi_hub/repositories/WeatherProvider.dart';
import 'package:pi_hub/screens/BootScreen.dart';
import 'package:pi_hub/screens/LockScreen.dart';
import 'package:pi_hub/screens/SetupScreen.dart';
import 'package:provider/provider.dart';

class PiHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(create: (context) => PeriodicImageProvider()),
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
      ],
      child: MaterialApp(
        title: "Pi Hub",
        routes: {
          'boot': (context) => BootScreen(),
          'lock': (context) => LockScreen(),
          'setup': (context) => SetupScreen(),
        },
        initialRoute: 'boot',
      ),
    );
  }
}