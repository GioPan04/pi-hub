import 'package:flutter/material.dart';
import 'package:squiggly_slider/slider.dart';

class PlayerSlider extends StatefulWidget {
  final double value;

  const PlayerSlider({
    required this.value,
    super.key,
  });

  @override
  State<PlayerSlider> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends State<PlayerSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.value = widget.value;
  }

  @override
  void didUpdateWidget(PlayerSlider old) {
    super.didUpdateWidget(old);
    if (old.value > widget.value) {
      _controller.animateTo(widget.value, duration: Durations.short3);
    } else if (old.value < widget.value) {
      _controller.animateTo(widget.value, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliderTheme(
      data: theme.sliderTheme.copyWith(trackHeight: 2),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SquigglySlider(
            squiggleAmplitude: 3,
            squiggleWavelength: 7.5,
            squiggleSpeed: 0.075,
            value: _controller.value,
            onChanged: (_) {},
          );
        },
      ),
    );
  }
}
