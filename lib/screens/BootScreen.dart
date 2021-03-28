import 'package:flutter/material.dart';
import 'package:pi_hub/repositories/PeriodicImageProvider.dart';
import 'package:pi_hub/repositories/TimeProvider.dart';
import 'package:pi_hub/repositories/WeatherProvider.dart';
import 'package:provider/provider.dart';

class BootScreen extends StatefulWidget {

  /// The bootscreen for PiHub
  const BootScreen({Key key}) : super(key: key);


  @override
  _BootScreenState createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {

  Future<void> _init() async {
    debugPrint("Booting PiHub...");

    // TODO: Check if the app was previusly configured
    if(!true) return Navigator.pushNamed(context, 'setup');
    
    // Do some work

    Provider.of<TimeProvider>(context, listen: false).init();
    Provider.of<PeriodicImageProvider>(context, listen: false).init();
    Provider.of<WeatherProvider>(context, listen: false).init('florence');

    // Example
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushNamed(context, 'lock');
  }

  @override
  void initState() { 
    super.initState();

    // When the first frame of the screen is rendered start loading
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10,),
          Text("PiHub is booting up...")
        ],
      ),
    );
  }
}