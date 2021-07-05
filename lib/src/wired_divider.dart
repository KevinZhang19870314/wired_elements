import 'package:flutter/material.dart';

import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

class WiredDivider extends StatelessWidget {
  const WiredDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 1,
          width: double.infinity,
          child: WiredCanvas(
            painter: WiredLineBase(
              x1: 0,
              y1: 0,
              x2: double.infinity,
              y2: 0,
            ),
            fillerType: RoughFilter.NoFiller,
          ),
        ),
        Divider(color: Colors.transparent),
      ],
    );
  }
}
