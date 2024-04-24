import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pi_hub/modules/background/widgets/random_background.dart';
import 'package:pi_hub/modules/clock/providers/clock.dart';
import 'package:pi_hub/modules/clock/widgets/big_clock.dart';

@RoutePage(name: 'ScreensaverRoute')
class ScreensaverPage extends ConsumerWidget {
  const ScreensaverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(clockProvider).valueOrNull ?? DateTime.now();

    return const Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            RandomBackground(),
            Positioned(
              bottom: 0,
              left: 20,
              child: BigClock(),
            )
          ],
        ),
      ),
    );
  }
}
