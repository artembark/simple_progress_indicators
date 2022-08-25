import 'package:flutter/material.dart';

///Foreground progress bar painter
///Requires [value] to set progress
///Optional [gradient] or [color] for bar infill
class ProgressBarPainter extends CustomPainter {
  const ProgressBarPainter({required this.value, this.gradient, this.color});

  ///current progress bar value
  final double value;

  ///progress bar gradient infill
  final Gradient? gradient;

  ///progress bar gradient color
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    setColorOrGradient(paint, size);
    drawClipForBeginning(canvas, size);
    drawProgressBar(canvas, size, paint);
  }

  void setColorOrGradient(Paint paint, Size size) {
    if (gradient != null) {
      paint.shader = gradient?.createShader(Offset.zero & size);
    }
    if (color != null) {
      paint.color = color!;
    }
  }

  void drawClipForBeginning(Canvas canvas, Size size) {
    canvas.clipRRect(RRect.fromRectAndRadius(
        Offset.zero & size, Radius.circular(size.height / 2)));
  }

  void drawProgressBar(Canvas canvas, Size size, Paint paint) {
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTRB(0, 0, size.width * value, size.height),
            Radius.circular(size.height / 2)),
        paint);
  }

  @override
  bool shouldRepaint(covariant ProgressBarPainter oldDelegate) {
    return value != oldDelegate.value;
  }
}
