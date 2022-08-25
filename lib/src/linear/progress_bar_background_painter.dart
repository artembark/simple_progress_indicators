import 'package:flutter/material.dart';

///Background progress bar painter
///Requires [backgroundColor] to set progress bar background color
class ProgressBarBackgroundPainter extends CustomPainter {
  const ProgressBarBackgroundPainter({required this.backgroundColor});

  ///progress bar backgroundColor
  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = backgroundColor;
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Offset.zero & size, Radius.circular(size.height / 2)),
        paint);
  }

  @override
  bool shouldRepaint(covariant ProgressBarBackgroundPainter oldDelegate) =>
      false;
}
