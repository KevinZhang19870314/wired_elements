import 'dart:ui';

import 'package:wired_elements/rough/rough.dart';

abstract class WiredPainterBase {
  void paintRough(
      Canvas canvas, Size size, DrawConfig drawConfig, Filler filler);
}
