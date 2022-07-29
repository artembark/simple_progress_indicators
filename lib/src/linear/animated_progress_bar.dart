import 'package:flutter/material.dart';

import 'progress_bar.dart';

class AnimatedProgressBar extends StatefulWidget {
  const AnimatedProgressBar(
      {Key? key,
      required this.duration,
      this.width = 200.0,
      this.height = 10.0,
      this.color,
      this.gradient,
      this.backgroundColor = Colors.transparent,
      this.curve = Curves.linear})
      : super(key: key);

  final Duration duration;
  final double width;
  final double height;
  final Color? color;
  final Gradient? gradient;
  final Color backgroundColor;
  final Curve curve;

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
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
