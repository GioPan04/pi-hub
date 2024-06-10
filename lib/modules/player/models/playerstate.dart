import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hub/modules/player/models/playbackstatus.dart';
import 'package:pi_hub/modules/player/models/playermetadata.dart';

part 'playerstate.freezed.dart';

@freezed
class PlayerState with _$PlayerState {
  factory PlayerState({
    required PlaybackStatus playbackStatus,
    PlayerMetadata? metadata,
    int? position,
  }) = _PlayerState;
}
