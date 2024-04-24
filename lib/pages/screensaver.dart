import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/background/widgets/random_background.dart';
import 'package:pi_hub/modules/clock/providers/clock.dart';

@RoutePage(name: 'ScreensaverRoute')
class ScreensaverPage extends ConsumerWidget {
  const ScreensaverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(clockProvider).valueOrNull ?? DateTime.now();

    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            const RandomBackground(),
            Positioned(
              bottom: 0,
              left: 20,
              child: Text(
                "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}",
                style: const TextStyle(color: Colors.white, fontSize: 96),
              ),
            )
          ],
        ),
      ),
    );
  }
}
