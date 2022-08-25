import 'package:flutter/material.dart';

import 'arc_bar_painter.dart';
import 'progress_bar_background_painter.dart';
import 'progress_bar_painter.dart';
import 'sine_bar_painter.dart';

//TODO:
/// Basic progress bar widget.
/// Use it for static progress indicators or control with your own
/// animation controller.
/// Requires [value] to show progress
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
class ArcBar extends StatelessWidget {
  const ArcBar(
      {Key? key,
      required this.value,
      this.width = 300.0,
      this.height = 70.0,
      this.color,
      this.backgroundColor = Colors.transparent,
      this.gradient,
      this.itemsAnimationList,
      required this.arcsAmount,
      this.arcLineWidth = 2.0})
      : assert(
          gradient == null || color == null,
          'Cannot provide both a color and a gradient',
        ),
        assert(
          gradient != null || color != null,
          'Need to provide color or gradient',
        ),
        super(key: key);

  ///progress bar width
  final double width;

  ///progress bar height
  final double height;

  ///current progress value
  final double? value;

  ///progress bar gradient parameter
  final Gradient? gradient;

  ///progress bar color parameter
  final Color? color;

  ///arcs amount
  final int arcsAmount;

  ///specify arc line width
  final double arcLineWidth;

  ///progress bar color parameter
  final Color backgroundColor;
  final List<Animation<double>>? itemsAnimationList;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(height * arcsAmount - arcLineWidth * (arcsAmount - 1), height),
      foregroundPainter: ArcBarPainter(
          value: value!,
          color: color,
          gradient: gradient,
          arcsAmount: arcsAmount,
          arcLineWidth: arcLineWidth,
          itemsAnimation: itemsAnimationList),
    );
  }
}
