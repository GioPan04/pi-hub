import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/background/models/image.dart';
import 'package:pi_hub/modules/background/services/random_background.dart';

final randomBackgroundProvider = StreamProvider<Image>(
  (ref) async* {
    void refresh() async {
      final now = DateTime.now();
      // Unique seed constant for 5 minutes
      final seed = now.copyWith(
        minute: now.minute - (now.minute % 5),
        second: 0,
        millisecond: 0,
        microsecond: 0,
      );

      ref.state = AsyncData(
        await RandomBackgroundService(client: Dio()).randomImage(
          "${seed.millisecondsSinceEpoch / 1000}",
        ),
      );
    }

    refresh();

    // Wait until the time has reached a minute % 5 == 0
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final delay = (60 * 5) - (now % (60 * 5));
    await Future.delayed(Duration(seconds: delay));
    final timer = Timer.periodic(const Duration(minutes: 5), (_) => refresh());
    refresh();

    ref.onDispose(() {
      timer.cancel();
    });
  },
);
