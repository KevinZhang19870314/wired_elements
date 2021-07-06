import 'package:flutter/material.dart';
import 'wired_base.dart';

import 'canvas/wired_canvas.dart';

class WiredDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const WiredDialog({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: WiredCanvas(
              painter: WiredRectangleBase(),
              fillerType: RoughFilter.NoFiller,
            ),
          ),
          Padding(
            padding: padding ?? EdgeInsets.all(20.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
