import 'package:dbus/dbus.dart';
import 'package:pi_hub/modules/player/models/playbackstatus.dart';
import 'package:pi_hub/modules/player/models/playermetadata.dart';

const _playerInterface = 'org.mpris.MediaPlayer2.Player';

class PlayerService {
  final DBusClient _client;
  final DBusRemoteObject _object;

  PlayerService({required DBusClient client})
      : _client = client,
        _object = DBusRemoteObject(
          client,
          name: 'org.mpris.MediaPlayer2.playerctld',
          path: DBusObjectPath('/org/mpris/MediaPlayer2'),
        );

  Future<void> close() => _client.close();

  Future<PlayerMetadata> getMetadata() async {
    final dbusRes = await _object.getProperty(
      _playerInterface,
      'Metadata',
    );

    return PlayerMetadata.fromDBus(dbusRes.asStringVariantDict());
  }

  Future<PlaybackStatus> getPlaybackStatus() async {
    final dbusRes = await _object.getProperty(
      _playerInterface,
      'PlaybackStatus',
    );

    return PlaybackStatus.fromDBus(dbusRes.asString());
  }

  Future<int> getPosition() async {
    final dbusRes = await _object.getProperty(
      _playerInterface,
      'Position',
    );

    return dbusRes.asInt64();
  }

  Future<void> playPause() {
    return _object.callMethod(_playerInterface, 'PlayPause', []);
  }

  Future<void> pause() {
    return _object.callMethod(_playerInterface, 'Pause', []);
  }

  Future<void> play() {
    return _object.callMethod(_playerInterface, 'Play', []);
  }

  Future<void> next() {
    return _object.callMethod(_playerInterface, 'Next', []);
  }

  Future<void> previous() {
    return _object.callMethod(_playerInterface, 'Previous', []);
  }
}
