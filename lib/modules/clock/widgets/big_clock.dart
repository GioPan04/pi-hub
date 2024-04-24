import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pi_hub/modules/clock/providers/clock.dart';

class BigClock extends ConsumerWidget {
  const BigClock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(clockProvider).valueOrNull ?? DateTime.now();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat.yMMMMEEEEd().format(clock),
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 96, color: Colors.white),
            children: [
              TextSpan(text: DateFormat('hh').format(clock)),
              const TextSpan(text: ':'),
              TextSpan(text: DateFormat('mm').format(clock)),
            ],
          ),
        ),
      ],
    );
  }
}
