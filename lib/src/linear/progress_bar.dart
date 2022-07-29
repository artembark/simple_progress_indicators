import 'package:flutter/material.dart';

import 'background_painter.dart';
import 'progress_painter.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
    required this.value,
    this.width = 200.0,
    this.height = 10.0,
    this.color,
    this.backgroundColor = Colors.transparent,
    this.gradient,
  })  : assert(
          gradient == null || color == null,
          'Cannot provide both a color and a gradient',
        ),
        assert(
          gradient != null || color != null,
          'Need to provide color or gradient',
        ),
        super(key: key);

  final double width;
  final double height;
  final double value;
  final Gradient? gradient;
  final Color? color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      foregroundPainter: ProgressPainter(
        value: value,
        color: color,
        gradient: gradient,
      ),
      painter: BackgroundPainter(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
