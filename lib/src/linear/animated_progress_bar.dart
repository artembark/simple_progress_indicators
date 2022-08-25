import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

/// Animated progress bar. Behaves like implicitly animated widget.
/// Check basic implicit animated Flutter widgets like [AnimatedContainer]
/// It animates [value] changes.
/// Requires [duration] to set filling duration timer
/// [onEnd] callback to trigger additional actions (e.g. another animation)
/// at the end of the current animation
/// [color] or [gradient] to fill the progress bar. Only one parameter is allowed.
/// Optional [backgroundColor], defaults to transparent
/// Optional [width] defaults to 200.0
/// Optional [height] defaults to 10.0
/// Optional [curve] defaults to [Curves.linear]
class AnimatedProgressBar extends ImplicitlyAnimatedWidget {
  const AnimatedProgressBar({
    Key? key,
    required Duration duration,
    required this.value,
    this.width = 200.0,
    this.height = 10.0,
    this.color,
    this.gradient,
    this.backgroundColor = Colors.transparent,
    Curve curve = Curves.linear,
    void Function()? onEnd,
  }) : super(key: key, duration: duration, curve: curve, onEnd: onEnd);

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

  ///progress bar color parameter
  final Color backgroundColor;

  @override
  AnimatedWidgetBaseState<AnimatedProgressBar> createState() =>
      _AnimatedBarState();
}

class _AnimatedBarState extends AnimatedWidgetBaseState<AnimatedProgressBar> {
  Tween<double>? _progressValue;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progressValue = visitor(_progressValue, widget.value,
            (dynamic value) => Tween<double>(begin: value as double))
        as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressBar(
      value: _progressValue?.evaluate(animation) ?? 0,
      width: widget.width,
      height: widget.height,
      gradient: widget.gradient,
      color: widget.color,
      backgroundColor: widget.backgroundColor,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DiagnosticsProperty<Tween>('progressValue', _progressValue,
        showName: false, defaultValue: null));
  }
}
