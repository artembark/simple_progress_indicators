import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../linear_indicators.dart';

//TODO:
///Foreground progress bar painter
///Requires [value] to set progress
///Optional [gradient] or [color] for bar infill
class SineBarBackgroundPainter extends CustomPainter {
  const SineBarBackgroundPainter({
    required this.color,
    required this.wavesNumber,
    required this.sineOffset,
    required this.sineLineWidth,
  });

  ///progress bar gradient color
  final Color color;

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
      ..color = color
      ..strokeCap = StrokeCap.round;

    Path path = createSinePath(size);
    canvas.drawPath(path, paint);
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
  bool shouldRepaint(covariant SineBarBackgroundPainter oldDelegate) {
    return false;
  }
}
