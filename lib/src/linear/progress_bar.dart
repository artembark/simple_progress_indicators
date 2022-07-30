import 'package:flutter/material.dart';

import 'background_painter.dart';
import 'progress_painter.dart';

/// Basic progress bar widget.
///
/// Requires [value] to show progress
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
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

  ///progress bar width
  final double width;

  ///progress bar height
  final double height;

  ///current progress value
  final double? value;

  ///progress bar gradient parameter
  final Gradient? gradient;

  ///progress bar color parameter
  final Color? color;

  ///progress bar color parameter
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      foregroundPainter: ProgressPainter(
        value: value!,
        color: color,
        gradient: gradient,
      ),
      painter: BackgroundPainter(
        backgroundColor: backgroundColor,
      ),
    );
  }
}
