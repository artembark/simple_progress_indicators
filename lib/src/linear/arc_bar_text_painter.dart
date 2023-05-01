import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

//TODO:
///Foreground progress bar painter
///Requires [value] to set progress
///Optional [gradient] or [color] for bar infill
class ArcBarTextPainter extends CustomPainter {
  const ArcBarTextPainter(
      {required this.value,
      this.gradient,
      this.color,
      required this.arcsAmount,
      this.arcLineWidth = 2.0,
      this.circleLineWidth = 2.0,
      this.itemsAnimation,
      this.textList})
      : assert(
          textList?.length == arcsAmount,
          'ArcsAmount should be equal to text list items amount',
        );

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
  final double circleLineWidth;

  final List<Animation<double>>? itemsAnimation;

  final List<String>? textList;

  @override
  void paint(Canvas canvas, Size size) {
    final double height = size.height;
    final double arcWidth = size.height - arcLineWidth;
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = circleLineWidth;

    if (gradient != null) {
      paint.shader = gradient?.createShader(Offset.zero & size);
    }
    if (color != null) {
      paint.color = color!;
    }

    for (int i = 0; i < arcsAmount; i++) {
      final Animation<double>? animation = itemsAnimation?.elementAt(i);
      final double animationValue = animation?.value ?? 1.0;
      canvas.drawCircle(
          Offset(
              arcWidth / 2 + arcLineWidth / 2 + arcWidth * i, size.height / 2),
          height / 3.5 * animationValue,
          paint);

      TextSpan span = TextSpan(
        style: TextStyle(
            fontSize: height / 3.5 * animationValue,
            foreground: paint,
            fontWeight: FontWeight.w200),
        text: textList?[i] ?? '${i + 1}',
      );
      TextPainter tp = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
      );
      tp.layout();
      tp.paint(
          canvas,
          Offset(arcWidth / 2 + arcLineWidth / 2 + arcWidth * i - tp.width / 2,
              (size.height - tp.height) / 2));
    }
  }

  @override
  bool shouldRepaint(covariant ArcBarTextPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}
