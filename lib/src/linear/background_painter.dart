import 'package:flutter/material.dart';

class BackgroundPainter extends CustomPainter {
  const BackgroundPainter({required this.backgroundColor});

  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Offset.zero & size, Radius.circular(size.height / 2)),
        paint..color = backgroundColor);
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) => false;
}
