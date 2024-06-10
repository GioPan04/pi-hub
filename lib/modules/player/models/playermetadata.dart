import 'package:dbus/dbus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playermetadata.freezed.dart';

@freezed
class PlayerMetadata with _$PlayerMetadata {
  const factory PlayerMetadata({
    String? title,
    List<String>? artists,
    String? album,
    String? artUrl,
    int? length,
  }) = _PlayerMetadata;

  factory PlayerMetadata.fromDBus(Map<String, DBusValue> data) {
    return PlayerMetadata(
      title: data['xesam:title']?.asString(),
      artists: data['xesam:artist']?.asStringArray().toList(),
      album: data['xesam:album']?.asString(),
      artUrl: data['mpris:artUrl']?.asString(),
      length: data['mpris:length']?.asInt64(),
    );
  }
}
