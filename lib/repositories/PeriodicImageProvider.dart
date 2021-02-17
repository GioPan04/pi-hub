import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:pi_hub/utils/Api/Unsplash.dart';

class PeriodicImageProvider with ChangeNotifier {
  List<int> _bgPic;
  List<int> get backgroundPicture => _bgPic;

  Future<void> updateBg() async {
    try {
      List<int> data = await UnsplashApi.randomImage();
      _bgPic = data;
      notifyListeners();
    } catch (e) {
      debugPrint("An error occuring during download the background image");
      debugPrint(e);
    }
  }

  void init() {
    updateBg();
    Timer.periodic(Duration(minutes: 15), (_) => updateBg());
  }

}