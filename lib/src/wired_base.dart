import 'package:flutter/material.dart';
import '../rough/rough.dart';
import 'const.dart';

import 'canvas/wired_painter_base.dart';
import 'wired_button.dart';

/// The utils for all wired widgets
class WiredBase {
  /// Default path painter for canvas
  static final Paint pathPaint = Paint()
    ..color = borderColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 1;

  /// Default fill painter for canvas
  static final Paint fillPaint = Paint()
    ..color = filledColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 1;

  /// The fill painter for canvas with [color]
  static Paint fillPainter(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 1;
  }

  /// The path painter for canvas with [strokeWidth]
  static Paint pathPainter(double strokeWidth) {
    return Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;
  }
}

/// The wired base widget usually being extends by specific wired widgets like
/// [WiredButton] for the purpose of isolates repaints.
///
/// If not do this, all the wired widgets (use rough decoration like [RoughBoxDecoration])
/// in current screen will repaints together, which is not make sence.
abstract class WiredBaseWidget extends StatelessWidget {
  const WiredBaseWidget({Key? key}) : super(key: key);

  /// Wrap with [RepaintBoundary] to isolates repaints.
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: key,
      child: buildWiredElement(),
    );
  }

  /// The method for extended widget to implement to build widgets.
  Widget buildWiredElement();
}

/// The mixin for isolates repaints.
///
/// See [WiredBaseWidget] for same purpose.
abstract class WiredRepaintMixin {
  Widget buildWiredElement({Key? key, required Widget child}) {
    return RepaintBoundary(
      key: key,
      child: child,
    );
  }
}

/// Base wired rectangle.
class WiredRectangleBase extends WiredPainterBase {
  /// The amount of empty space to the leading edge of the rectangle.
  final double leftIndent;

  /// The amount of empty space to the trailing edge of the rectangle.
  final double rightIndent;

  final Color fillColor;

  WiredRectangleBase({
    this.leftIndent = 0.0,
    this.rightIndent = 0.0,
    this.fillColor = filledColor,
  });

  @override
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler) {
    Generator generator = Generator(drawConfig, filler);

    Drawable figure = generator.rectangle(
      0 + leftIndent,
      0,
      size.width - leftIndent - rightIndent,
      size.height,
    );
    canvas.drawRough(
        figure, WiredBase.pathPaint, WiredBase.fillPainter(fillColor));
  }
}

/// Base wired inverted triangle.
class WiredInvertedTriangleBase extends WiredPainterBase {
  @override
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler) {
    Generator generator = Generator(drawConfig, filler);

    final points = [
      PointD(0, 0),
      PointD(size.width, 0),
      PointD(size.width / 2, size.height),
    ];
    Drawable figure = generator.polygon(points);
    canvas.drawRough(
        figure, WiredBase.pathPaint, WiredBase.fillPainter(borderColor));
  }
}

/// Base wired line with start point [x1], [y1] and end point [x2], [y2] using [strokeWidth].
///
/// [strokeWidth] defaults to 1.
class WiredLineBase extends WiredPainterBase {
  final double x1, y1;
  final double x2, y2;
  final double strokeWidth;

  WiredLineBase({
    Key? key,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    this.strokeWidth = 1,
  });

  @override
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler) {
    var _x1 = x1, _y1 = y1, _x2 = x2, _y2 = y2;
    if (x1 < 0) _x1 = 0;
    if (x1 > size.width) _x1 = size.width;
    if (y1 < 0) _y1 = 0;
    if (y1 > size.height) _y1 = size.height;

    if (x2 < 0) _x2 = 0;
    if (x2 > size.width) _x2 = size.width;
    if (y2 < 0) _y2 = 0;
    if (y2 > size.height) _y2 = size.height;

    Generator generator = Generator(drawConfig, filler);

    Drawable figure = generator.line(_x1, _y1, _x2, _y2);
    canvas.drawRough(
        figure, WiredBase.pathPainter(strokeWidth), WiredBase.fillPaint);
  }
}

/// Base wired circle with [diameterRatio] and [fillColor].
///
/// If [diameterRatio] = 1, then the diameter of circle is the canvas's width.
class WiredCircleBase extends WiredPainterBase {
  final double diameterRatio;
  final Color fillColor;
  WiredCircleBase({this.diameterRatio = 1, this.fillColor = filledColor});

  @override
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler) {
    Generator generator = Generator(drawConfig, filler);

    Drawable figure = generator.circle(
      size.width / 2,
      size.height / 2,
      size.width > size.height
          ? size.width * diameterRatio
          : size.height * diameterRatio,
    );
    canvas.drawRough(
        figure, WiredBase.pathPaint, WiredBase.fillPainter(fillColor));
  }
}
