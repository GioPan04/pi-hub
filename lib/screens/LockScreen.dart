import 'package:flutter/material.dart';
import 'package:pi_hub/widgets/LockScreen/BackgroundImage.dart';
import 'package:pi_hub/widgets/LockScreen/LockTime.dart';


class LockScreen extends StatefulWidget {
  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          LockBackgroundImage(),
          Positioned(
            bottom: 10,
            left: 10,
            child: LockTime()
          )
        ],
      )
    );
  }
}