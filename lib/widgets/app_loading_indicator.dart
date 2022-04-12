/*
 * Created with Android Studio.
 * User: tal
 * Date: 2020-01-13
 * Time: 16:37
 * target: iOS 风格的菊花
 */

import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

const double _kDefaultIndicatorRadius = 10.0;

// Extracted from iOS 13.2 Beta.
const Color _kActiveTickColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFFFFFFFF),
  darkColor: Color(0xFFEBEBF5),
);

const Color darkColor = CupertinoDynamicColor.withBrightness(
  color: Color(0xFF222222),
  darkColor: Color(0xFFEBEBF5),
);

/// An iOS-style activity indicator that spins clockwise.
///
/// See also:
///
///  * <https://developer.apple.com/ios/human-interface-guidelines/controls/progress-indicators/#activity-indicators>
class AppActivityIndicator extends StatefulWidget {
  /// Creates an iOS-style activity indicator that spins clockwise.
  const AppActivityIndicator(
      {this.animating = true,
      this.radius = _kDefaultIndicatorRadius,
      this.indicatorColor = _kActiveTickColor})
      : assert(animating != null),
        assert(radius != null),
        assert(radius > 0),
        super();

  /// Whether the activity indicator is running its animation.
  ///
  /// Defaults to true.
  final bool animating;

  /// Radius of the spinner widget.
  ///
  /// Defaults to 10px. Must be positive and cannot be null.
  final double radius;

  // 菊花颜色
  final Color indicatorColor;

  @override
  _AppActivityIndicatorState createState() => _AppActivityIndicatorState();
}

class _AppActivityIndicatorState extends State<AppActivityIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    if (widget.animating) _controller.repeat();
  }

  @override
  void didUpdateWidget(AppActivityIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animating != oldWidget.animating) {
      if (widget.animating)
        _controller.repeat();
      else
        _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.radius * 2,
      width: widget.radius * 2,
      child: CustomPaint(
        painter: _AppActivityIndicatorPainter(
          position: _controller,
          activeColor:
              CupertinoDynamicColor.resolve(widget.indicatorColor, context),
          radius: widget.radius,
        ),
      ),
    );
  }
}

const double _kTwoPI = math.pi * 2.0;
const int _kTickCount = 12;

// Alpha values extracted from the native component (for both dark and light mode).
// The list has a length of 12.
const List<int> _alphaValues = <int>[
  147,
  131,
  114,
  97,
  81,
  64,
  47,
  47,
  47,
  47,
  47,
  47
];

class _AppActivityIndicatorPainter extends CustomPainter {
  _AppActivityIndicatorPainter({
    required this.position,
    required this.activeColor,
    required double radius,
  })  : tickFundamentalRRect = RRect.fromLTRBXY(
          -radius,
          radius / _kDefaultIndicatorRadius,
          -radius / 2.0,
          -radius / _kDefaultIndicatorRadius,
          radius / _kDefaultIndicatorRadius,
          radius / _kDefaultIndicatorRadius,
        ),
        super(repaint: position);

  final Animation<double> position;
  final RRect tickFundamentalRRect;
  final Color activeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();

    canvas.save();
    canvas.translate(size.width / 2.0, size.height / 2.0);

    final int activeTick = (_kTickCount * position.value).floor();

    for (int i = 0; i < _kTickCount; ++i) {
      final int t = (i + activeTick) % _kTickCount;
      paint.color = activeColor.withAlpha(_alphaValues[t]);
      canvas.drawRRect(tickFundamentalRRect, paint);
      canvas.rotate(-_kTwoPI / _kTickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_AppActivityIndicatorPainter oldPainter) {
    return oldPainter.position != position ||
        oldPainter.activeColor != activeColor;
  }
}
