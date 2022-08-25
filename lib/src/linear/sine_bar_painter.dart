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
    required this.wavesAmount,
    required this.startDirection,
    required this.sineLineWidth,
  });

  ///current progress bar value
  final double value;

  ///progress bar gradient infill
  final Gradient? gradient;

  ///progress bar gradient color
  final Color? color;

  ///waves amount
  final int wavesAmount;

  ///specify moving direction
  final StartDirection startDirection;

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

    var sinePath = createSinePath(size);
    PathMetrics pathMetricsForSine = sinePath.computeMetrics();
    for (PathMetric pathMetricForSine in pathMetricsForSine) {
      Path extractPath =
          pathMetricForSine.extractPath(0.0, pathMetricForSine.length * value);
      canvas.drawPath(extractPath, paint);
    }
    paint.strokeWidth = 1.0;
    canvas.drawRect(Offset.zero & size, paint);
  }

  Path createSinePath(Size size) {
    int direction;
    switch (startDirection) {
      case StartDirection.up:
        direction = -1;
        break;
      case StartDirection.down:
        direction = 1;
    }

    var path = Path();
    path.moveTo(0, size.height / 2);
    for (var t = 0.0; t <= 1.01; t += 0.01) {
      var val = direction *
              sin(wavesAmount * 0.5 * 2 * pi * t) *
              (size.height - sineLineWidth) *
              0.5 +
          0.5 * size.height;
      path.lineTo(t * size.width, val);
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant SineBarPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}
