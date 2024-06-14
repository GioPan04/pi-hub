import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/player/models/playbackstatus.dart';
import 'package:pi_hub/modules/player/providers/player.dart';
import 'package:pi_hub/modules/player/widgets/playerslider.dart';

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

class LargePlayer extends ConsumerWidget {
  const LargePlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final metadata = ref.watch(playerProvider);
    final player = ref.read(playerServiceProvider);
    final art = ref.watch(_playerArtProvider);
    final colorScheme = ref.watch(_playerColorSchemeProvider).value;
    final theme = Theme.of(context);

    return switch (metadata) {
      AsyncData(:final value) => value.metadata != null
          ? Theme(
              data: ThemeData(
                colorScheme: colorScheme ?? theme.colorScheme,
              ),
              child: Builder(builder: (context) {
                return DecoratedBox(
                  decoration:
                      BoxDecoration(color: colorScheme?.primaryContainer),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          art.value != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image(image: art.value!, width: 256),
                                )
                              : const SizedBox.shrink(),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.metadata!.title ??
                                                  'No title',
                                              style:
                                                  theme.textTheme.headlineLarge,
                                            ),
                                            Text(
                                                value.metadata!.artists
                                                        ?.join(', ') ??
                                                    'No artists',
                                                style: theme
                                                    .textTheme.bodyMedium
                                                    ?.copyWith(
                                                        color: theme.textTheme
                                                            .bodyMedium!.color!
                                                            .withOpacity(0.8))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    FloatingActionButton.large(
                                      elevation: 0,
                                      backgroundColor:
                                          colorScheme?.onPrimaryContainer,
                                      foregroundColor: Colors.white,
                                      child: Icon(
                                        value.playbackStatus ==
                                                PlaybackStatus.playing
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                      onPressed: () => player.playPause(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                Row(children: [
                                  const SizedBox(width: 24.0),
                                  IconButton(
                                    color: colorScheme?.onPrimaryContainer,
                                    icon: const Icon(Icons.skip_previous),
                                    onPressed: () => player.previous(),
                                  ),
                                  value.metadata!.length != null &&
                                          value.position != null
                                      ? Expanded(
                                          child: PlayerSlider(
                                            value: value.position! /
                                                value.metadata!.length!,
                                            onChanged: (pos) =>
                                                player.setPosition(
                                              value.metadata!.trackid!,
                                              (pos * value.metadata!.length!)
                                                  .toInt(),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.expand(),
                                  IconButton(
                                    color: colorScheme?.onPrimaryContainer,
                                    icon: const Icon(Icons.skip_next),
                                    onPressed: () => player.next(),
                                  ),
                                ]),
                              ],
                            ),
                          ),
                        ],
                      ),
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
