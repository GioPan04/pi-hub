import 'dart:async';

import 'package:dbus/dbus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/player/models/playbackstatus.dart';
import 'package:pi_hub/modules/player/models/playerstate.dart';
import 'package:pi_hub/modules/player/services/player.dart';

final playerServiceProvider = Provider(
  (ref) => PlayerService(client: DBusClient.session()),
);

final playerProvider = StreamProvider<PlayerState>((ref) async* {
  final service = ref.read(playerServiceProvider);

  Future<PlayerState> update() async {
    final playbackStatus = await service.getPlaybackStatus();

    if (playbackStatus == PlaybackStatus.stopped) {
      return PlayerState(playbackStatus: playbackStatus);
    } else {
      return PlayerState(
        playbackStatus: playbackStatus,
        metadata: await service.getMetadata(),
        position: await service.getPosition(),
      );
    }
  }

  final timer = Timer.periodic(
    const Duration(seconds: 1),
    (_) async {
      ref.state = await AsyncValue.guard(update);
    },
  );

  ref.onDispose(() => timer.cancel());
});
