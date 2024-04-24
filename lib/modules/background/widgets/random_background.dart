import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/background/providers/background.dart';

class RandomBackground extends ConsumerWidget {
  const RandomBackground({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final background = ref.watch(randomBackgroundProvider).valueOrNull;

    if (background == null) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(background.photo),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          left: 0,
          child: Row(
            children: [
              const Spacer(),
              Text(
                background.author,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
