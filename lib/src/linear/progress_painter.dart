import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  const ProgressPainter({required this.value, this.gradient, this.color});

  final double value;
  final Gradient? gradient;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (gradient != null) {
      paint.shader = gradient?.createShader(Offset.zero & size);
    }
    if (color != null) {
      paint.color = color!;
    }

    canvas.clipRRect(RRect.fromRectAndRadius(
        Offset.zero & size, Radius.circular(size.height / 2)));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(0, 0, size.width * value, size.height),
            Radius.circular(size.height / 2)),
        paint);
  }

  @override
  bool shouldRepaint(covariant ProgressPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}
