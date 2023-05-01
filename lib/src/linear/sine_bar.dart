import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/src/linear/sine_bar_background_painter.dart';

import '../linear_indicators.dart';

//TODO:
/// Basic progress bar widget.
/// Use it for static progress indicators or control with your own
/// animation controller.
/// Requires [value] to show progress
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
class SineBar extends StatelessWidget {
  const SineBar(
      {Key? key,
      required this.value,
      this.width = 200.0,
      this.height = 40.0,
      this.color,
      this.backgroundColor = Colors.transparent,
      this.gradient,
      this.wavesNumber = 6,
      this.sineOffset = 0,
      this.sineLineWidth = 10.0})
      : assert(
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
  final double value;

  ///progress bar gradient parameter
  final Gradient? gradient;

  ///progress bar color parameter
  final Color? color;

  ///progress bar color parameter
  final Color backgroundColor;

  ///waves number
  final int wavesNumber;

  ///specify sine offset
  final double sineOffset;

  ///specify sine line width
  final double sineLineWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      foregroundPainter: SineBarPainter(
          value: value,
          color: color,
          gradient: gradient,
          wavesNumber: wavesNumber,
          sineOffset: sineOffset,
          sineLineWidth: sineLineWidth),
      painter: SineBarBackgroundPainter(
          color: backgroundColor,
          wavesNumber: wavesNumber,
          sineOffset: sineOffset,
          sineLineWidth: sineLineWidth),
    );
  }
}
