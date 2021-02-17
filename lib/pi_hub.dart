import 'package:flutter/material.dart';
import 'package:pi_hub/repositories/PeriodicImageProvider.dart';
import 'package:pi_hub/repositories/TimeProvider.dart';
import 'package:pi_hub/screens/BootScreen.dart';
import 'package:pi_hub/screens/LockScreen.dart';
import 'package:provider/provider.dart';

class PiHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(create: (context) => PeriodicImageProvider()),
      ],
      child: MaterialApp(
        title: "Pi Hub",
        routes: {
          'boot': (context) => BootScreen(),
          'lock': (context) => LockScreen()
        },
        initialRoute: 'boot',
      ),
    );
  }
}