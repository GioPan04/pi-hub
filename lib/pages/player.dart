import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pi_hub/modules/player/widgets/large_player.dart';

@RoutePage(name: 'PlayerRoute')
class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LargePlayer(),
    );
  }
}
