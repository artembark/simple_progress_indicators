import 'package:flutter/material.dart';

import 'arc_bar_painter.dart';
import 'arc_bar_text_painter.dart';
import 'progress_bar_background_painter.dart';
import 'progress_bar_painter.dart';
import 'sine_bar_painter.dart';

//TODO:
/// Arc bar widget.
/// Use it for static progress indicators or control with your own
/// animation controller.
/// Requires [value] to show progress
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
class ArcBar extends StatelessWidget {
  const ArcBar({
    Key? key,
    required this.value,
    this.width = 300.0,
    this.height = 70.0,
    this.color,
    this.backgroundColor = Colors.transparent,
    this.gradient,
    this.itemsAnimationList,
    required this.arcsAmount,
    this.arcLineWidth = 2.0,
    this.textList,
  })  : assert(
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
  final double value;

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
  final List<String>? textList;
  final List<Widget>? widgetList = const [
    Icon(Icons.add),
    Icon(Icons.home),
    Icon(Icons.ac_unit),
    Icon(Icons.access_alarm),
    Icon(Icons.accessibility),
    Icon(Icons.add_card),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: Size(
              height * arcsAmount - arcLineWidth * (arcsAmount - 1), height),
          foregroundPainter: ArcBarTextPainter(
              value: value,
              color: color,
              gradient: gradient,
              arcsAmount: arcsAmount,
              arcLineWidth: arcLineWidth,
              circleLineWidth: arcLineWidth / 4,
              itemsAnimation: itemsAnimationList,
              textList: ['', '', '', '', '', '']),
          painter: ArcBarPainter(
            value: value,
            color: color,
            gradient: gradient,
            arcsAmount: arcsAmount,
            arcLineWidth: arcLineWidth,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            //TODO: ! remove
            return gradient!.createShader(bounds);
          },
          child: SizedBox(
            width: height * arcsAmount - arcLineWidth * (arcsAmount),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //TODO: !
                children: widgetList!
                    .map((e) => ScaleTransition(
                          scale: itemsAnimationList!
                              .elementAt(widgetList!.indexOf(e)),
                          child: e,
                        ))
                    .toList()),
          ),
        ),
      ],
    );
  }
}
