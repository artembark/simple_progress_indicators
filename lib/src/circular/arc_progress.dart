/*import 'dart:math' as math;

import 'package:flutter/material.dart';

class GradientArcPainterDemo extends StatefulWidget {
  const GradientArcPainterDemo({
    Key key,
  }) : super(key: key);

  @override
  GradientArcPainterDemoState createState() => GradientArcPainterDemoState();
}

class GradientArcPainterDemoState extends State<GradientArcPainterDemo> {
  double _progress = 0.9;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text('GradientArcPainter Demo')),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _progress += 0.1;
          });
        },
        child: Center(
          child: SizedBox(
            width: 200.0,
            height: 200.0,
            child: CustomPaint(
              painter: GradientArcPainter(
                progress: _progress,
                startColor: Colors.blue,
                endColor: Colors.red,
                width: 8.0,
              ),
              child: Center(child: Text('$_progress')),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientArcPainter extends CustomPainter {
  const GradientArcPainter({
    @required this.progress,
    @required this.startColor,
    @required this.endColor,
    @required this.width,
  })  : assert(progress != null),
        assert(startColor != null),
        assert(endColor != null),
        assert(width != null),
        super();

  final double progress;
  final Color startColor;
  final Color endColor;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    final gradient = new SweepGradient(
      startAngle: 3 * math.pi / 2,
      endAngle: 7 * math.pi / 2,
      tileMode: TileMode.repeated,
      colors: [startColor, endColor],
    );

    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.butt  // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (width / 2);
    final startAngle = -math.pi / 2;
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radius),
        startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
*/
