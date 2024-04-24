import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final clockProvider = StreamProvider<DateTime>(
  (ref) async* {
    void refresh() {
      ref.state = AsyncData(DateTime.now());
    }

    refresh();

    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final delay = 60 - (now % 60);
    await Future.delayed(Duration(seconds: delay));
    final timer = Timer.periodic(const Duration(seconds: 60), (_) => refresh());
    refresh();

    ref.onDispose(() {
      timer.cancel();
    });
  },
);
