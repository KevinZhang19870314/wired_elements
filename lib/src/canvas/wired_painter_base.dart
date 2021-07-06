import 'dart:ui';

import '../../rough/rough.dart';

abstract class WiredPainterBase {
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler);
}
