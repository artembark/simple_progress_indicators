import 'package:flutter/material.dart';

import '../linear_indicators.dart';

/// Instantly animating arc bar.
/// Requires [duration] to set filling duration timer
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// TODO: Optional [width] defaults to 200.0
/// TODO: Optional [height] defaults to 10.0
/// Optional [curve] defaults to [Curves.linear]

class ArcBarAnimation extends StatefulWidget {
  const ArcBarAnimation(
      {Key? key,
      required this.duration,
      this.width = 200.0,
      this.height = 40.0,
      this.color,
      this.gradient,
      this.backgroundColor = Colors.transparent,
      this.curve = Curves.linear,
      this.startDirection = StartDirection.up,
      this.arcsAmount = 3,
      this.arcLineWidth = 10.0})
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

  ///arcs amount
  final int arcsAmount;

  ///specify moving direction
  final StartDirection startDirection;

  ///specify arc line width
  final double arcLineWidth;

  @override
  State<ArcBarAnimation> createState() => _ArcBarAnimationState();
}

class _ArcBarAnimationState extends State<ArcBarAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  List<Animation<double>> _animationList = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    for (int i = 1; i <= widget.arcsAmount; i++) {
      final double endPoint = 1 / widget.arcsAmount * i;
      _animationList
          .add(Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          endPoint - 1 / widget.arcsAmount / 3,
          endPoint,
          curve: widget.curve,
        ),
      )));
    }
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
        return ArcBar(
          value: _progressAnimation.value,
          width: widget.width,
          height: widget.height,
          gradient: widget.gradient,
          color: widget.color,
          backgroundColor: widget.backgroundColor,
          arcsAmount: widget.arcsAmount,
          arcLineWidth: widget.arcLineWidth,
          itemsAnimationList: _animationList,
        );
      },
    );
  }
}
