import 'package:flutter/material.dart';

import 'progress_bar.dart';

/// Instantly animating progress bar.
/// Requires [duration] to set filling duration timer
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
/// Optional [curve] defaults to [Curves.linear]

class ProgressBarAnimation extends StatefulWidget {
  const ProgressBarAnimation(
      {Key? key,
      required this.duration,
      this.width = 200.0,
      this.height = 10.0,
      this.color,
      this.gradient,
      this.backgroundColor = Colors.transparent,
      this.curve = Curves.linear})
      : super(key: key);

  ///animation duration
  final Duration duration;

  ///progress bar width
  final double width;

  ///progress bar height
  final double height;

  ///progress bar color
  final Color? color;

  ///progress bar gradient
  final Gradient? gradient;

  ///progress bar backgroundColor
  final Color backgroundColor;

  ///progress bar animation curve
  final Curve curve;

  @override
  State<ProgressBarAnimation> createState() => _ProgressBarAnimationState();
}

class _ProgressBarAnimationState extends State<ProgressBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return ProgressBar(
          value: _progressAnimation.value,
          width: widget.width,
          height: widget.height,
          gradient: widget.gradient,
          color: widget.color,
          backgroundColor: widget.backgroundColor,
        );
      },
    );
  }
}
