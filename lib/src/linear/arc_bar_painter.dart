import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

//TODO:
///Foreground progress bar painter
///Requires [value] to set progress
///Optional [gradient] or [color] for bar infill
class ArcBarPainter extends CustomPainter {
  const ArcBarPainter({
    required this.value,
    this.gradient,
    this.color,
    required this.arcsAmount,
    this.arcLineWidth = 2.0,
  });

  ///current progress bar value
  final double value;

  ///progress bar gradient infill
  final Gradient? gradient;

  ///progress bar gradient color
  final Color? color;

  ///arcs amount
  final int arcsAmount;

  ///specify arc line width
  final double arcLineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double arcWidth = size.height - arcLineWidth;
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = arcLineWidth;

    if (gradient != null) {
      paint.shader = gradient?.createShader(Offset.zero & size);
    }
    if (color != null) {
      paint.color = color!;
    }
    paint.strokeWidth = arcLineWidth * 2;
    canvas.drawPoints(
        PointMode.points, [Offset(arcLineWidth / 2, height / 2)], paint);
    if (value == 1.0) {
      canvas.drawPoints(PointMode.points,
          [Offset(size.width - arcLineWidth / 2, height / 2)], paint);
    }
    paint.strokeWidth = arcLineWidth;
    Path createPath() {
      Path path = Path();
      path.moveTo(arcLineWidth / 2, height / 2);
      for (int i = 0; i < arcsAmount; i++) {
        path.arcToPoint(
          Offset(arcWidth * i + arcWidth + arcLineWidth / 2, height / 2),
          radius: Radius.circular(height / 2 - arcLineWidth / 2),
          clockwise: i.isEven,
        );
      }
      return path;
    }

    var pathForArcs = createPath();
    PathMetrics pathMetricsForArcs = pathForArcs.computeMetrics();
    for (PathMetric pathMetricForArc in pathMetricsForArcs) {
      Path extractPath =
          pathMetricForArc.extractPath(0.0, pathMetricForArc.length * value);
      canvas.drawPath(extractPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant ArcBarPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}
