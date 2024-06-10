import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/player/models/playbackstatus.dart';
import 'package:pi_hub/modules/player/providers/player.dart';
import 'package:pi_hub/modules/player/widgets/playerslider.dart';
import 'package:squiggly_slider/slider.dart';

final _playerArtProvider = FutureProvider<NetworkImage?>((ref) async {
  final artUrl = await ref.watch(
    playerProvider.selectAsync((it) => it.metadata?.artUrl),
  );

  if (artUrl == null) return null;

  return NetworkImage(artUrl);
});

final _playerColorSchemeProvider = FutureProvider<ColorScheme?>((ref) async {
  final art = ref.watch(_playerArtProvider).value;

  if (art == null) return null;

  final a = await ColorScheme.fromImageProvider(
    provider: art,
    brightness: Brightness.light,
  );

  return a;
});

class Player extends ConsumerWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metadata = ref.watch(playerProvider);
    final player = ref.read(playerServiceProvider);
    final art = ref.watch(_playerArtProvider);
    final colorScheme = ref.watch(_playerColorSchemeProvider).value;
    final originalTheme = Theme.of(context);

    return switch (metadata) {
      AsyncData(:final value) => value.metadata != null
          ? Theme(
              data: ThemeData(
                colorScheme: colorScheme ?? originalTheme.colorScheme,
              ),
              child: Builder(builder: (context) {
                return DecoratedBox(
                  decoration:
                      BoxDecoration(color: colorScheme?.primaryContainer),
                  child: Center(
                    child: Row(
                      children: [
                        art.value != null
                            ? Image(image: art.value!, width: 256)
                            : const SizedBox.shrink(),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(value.metadata!.title ?? 'No title'),
                              Text(value.metadata!.artists?.join(', ') ??
                                  'No artists'),
                              value.metadata!.length != null &&
                                      value.position != null
                                  ? PlayerSlider(
                                      value: value.position! /
                                          value.metadata!.length!,
                                    )
                                  : const SizedBox.shrink(),
                              IconButton(
                                icon: Icon(
                                  value.playbackStatus == PlaybackStatus.playing
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                ),
                                onPressed: () => player.playPause(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )
          : const Text("Stopped"),
      AsyncError(:final error) => Text(error.toString()),
      _ => const Text('loading')
    };
  }
}
