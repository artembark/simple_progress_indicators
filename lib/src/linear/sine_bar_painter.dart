import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../linear_indicators.dart';

//TODO:
///Foreground progress bar painter
///Requires [value] to set progress
///Optional [gradient] or [color] for bar infill
class SineBarPainter extends CustomPainter {
  const SineBarPainter({
    required this.value,
    this.gradient,
    this.color,
    required this.wavesNumber,
    required this.sineOffset,
    required this.sineLineWidth,
  });

  ///current progress bar value
  final double value;

  ///progress bar gradient infill
  final Gradient? gradient;

  ///progress bar gradient color
  final Color? color;

  ///waves number
  final int wavesNumber;

  //specify sine offset
  final double sineOffset;

  ///specify sine line width
  final double sineLineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = sineLineWidth
      ..strokeCap = StrokeCap.round;
    if (gradient != null) {
      paint.shader = gradient?.createShader(Offset.zero & size);
    }
    if (color != null) {
      paint.color = color!;
    }

    Path sinePath = createSinePath(size);
    PathMetrics pathMetricsForSine = sinePath.computeMetrics();
    for (PathMetric pathMetricForSine in pathMetricsForSine) {
      Path extractPath =
          pathMetricForSine.extractPath(0.0, pathMetricForSine.length * value);
      canvas.drawPath(extractPath, paint);
    }
  }

  Path createSinePath(Size size) {
    Path path = Path();
    path.moveTo(0, sineY(size, 0));
    for (var t = 0.0; t <= 1.01; t += 0.01) {
      path.lineTo(t * size.width, sineY(size, t));
    }
    return path;
  }

  double sineY(Size size, double t) {
    return sin(wavesNumber * 0.5 * 2 * pi * t + pi * sineOffset) *
            (size.height - sineLineWidth) *
            0.5 +
        0.5 * size.height;
  }

  @override
  bool shouldRepaint(covariant SineBarPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}