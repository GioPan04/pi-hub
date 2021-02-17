import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

DateFormat _timeFormat = DateFormat("HH:mm"); 
DateFormat _dateFormat = DateFormat("E, MMM dd, yyyy"); 

class TimeProvider with ChangeNotifier {
  DateTime _time = DateTime.now();
  
  String get formattedTime => _timeFormat.format(_time);
  String get formattedDate => _dateFormat.format(_time);

  void updateTime() {
    _time = DateTime.now();
    notifyListeners();
  }

  void init() {
    Timer.periodic(Duration(seconds: 1), (_) => updateTime());
  }
}