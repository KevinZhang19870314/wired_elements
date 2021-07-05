import 'package:flutter/material.dart';
import 'package:wired_elements/rough/rough.dart';
import 'package:wired_elements/src/const.dart';

import 'canvas/wired_painter_base.dart';

class WiredBase {
  static final Paint pathPaint = Paint()
    ..color = borderColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.square
    ..strokeWidth = 1;

  static final Paint fillPaint = Paint()
    ..color = filledColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 1;

  static Paint fillPainter(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 1;
  }
}

abstract class WiredBaseWidget extends StatelessWidget {
  const WiredBaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: key,
      child: buildWiredElement(),
    );
  }

  Widget buildWiredElement();
}

abstract class WiredRepaintMixin {
  Widget buildWiredElement({Key? key, required Widget child}) {
    return RepaintBoundary(
      key: key,
      child: child,
    );
  }
}

class WiredBaseRectangle extends WiredPainterBase {
  @override
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler) {
    Generator generator = Generator(drawConfig, filler);

    Drawable figure = generator.rectangle(0, 0, size.width, size.height);
    canvas.drawRough(figure, WiredBase.pathPaint, WiredBase.fillPaint);
  }
}

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

class WiredLineBase extends WiredPainterBase {
  final double x1, y1;
  final double x2, y2;

  WiredLineBase({
    Key? key,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
  });

  @override
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler) {
    var _x1 = 0.0, _y1 = 0.0, _x2 = 0.0, _y2 = 0.0;
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
    canvas.drawRough(figure, WiredBase.pathPaint, WiredBase.fillPaint);
  }
}
