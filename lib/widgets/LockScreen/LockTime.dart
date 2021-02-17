import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pi_hub/repositories/TimeProvider.dart';
import 'package:provider/provider.dart';

class LockTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeProvider>(
      builder: (context, time, _) => DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time.formattedTime,
              style: TextStyle(fontSize: 50),
            ),
            Text(
              time.formattedDate,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}