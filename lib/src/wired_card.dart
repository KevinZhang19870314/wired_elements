import 'package:flutter/material.dart';
import 'package:wired_elements/src/canvas/wired_canvas.dart';
import 'package:wired_elements/src/wired_base.dart';

class WiredCard extends StatelessWidget {
  final Widget? child;
  final bool fill;
  final double? height;

  const WiredCard({
    Key? key,
    this.child,
    this.fill = false,
    this.height = 130.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: height,
      child: Stack(
        children: [
          WiredCanvas(
            painter: WiredRectangleBase(),
            fillerType: fill ? RoughFilter.HachureFiller : RoughFilter.NoFiller,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: child,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
