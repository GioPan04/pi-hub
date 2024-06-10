enum PlaybackStatus {
  playing,
  paused,
  stopped;

  factory PlaybackStatus.fromDBus(String dbus) {
    return switch (dbus) {
      'Playing' => PlaybackStatus.playing,
      'Paused' => PlaybackStatus.paused,
      'Stopped' => PlaybackStatus.stopped,
      _ => throw UnimplementedError(),
    };
  }
}
