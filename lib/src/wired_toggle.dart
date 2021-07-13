import 'package:flutter/material.dart';
import 'package:wired_elements/rough/rough.dart';

import 'canvas/wired_canvas.dart';
import 'const.dart';
import 'wired_base.dart';

/// Wired toggle
class WiredToggle extends StatefulWidget {
  final bool value;
  final bool Function(bool)? onChange;

  const WiredToggle({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  _WiredToggleState createState() => _WiredToggleState();
}

class _WiredToggleState extends State<WiredToggle>
    with SingleTickerProviderStateMixin, WiredRepaintMixin {
  bool _isSwitched = false;
  final double _thumbRadius = 24.0;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.value;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: -_thumbRadius,
      end: _thumbRadius * 1.5,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    )..addListener(
        () {
          setState(() {});
        },
      );

    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    return buildWiredElement(
      child: GestureDetector(
        onTap: () {
          if (widget.onChange != null) {
            bool result = widget.onChange!(!_isSwitched);
            if (result) {
              _isSwitched = !_isSwitched;
              _toggle();
            }
          }
        },
        child: _buildSwicher(),
      ),
    );
  }

  Widget _buildSwicher() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: _animation.value,
          top: -_thumbRadius / 2,
          child: SizedBox(
            height: _thumbRadius * 2,
            width: _thumbRadius * 2,
            child: WiredCanvas(
              painter: WiredCircleBase(
                diameterRatio: .7,
                fillColor: textColor,
              ),
              fillerType: RoughFilter.HachureFiller,
              fillerConfig: FillerConfig.build(hachureGap: 1.0),
            ),
          ),
        ),
        SizedBox(
          width: _thumbRadius * 2.5,
          height: _thumbRadius,
          child: WiredCanvas(
            painter: WiredRectangleBase(),
            fillerType: RoughFilter.NoFiller,
          ),
        ),
      ],
    );
  }

  void _toggle() {
    _isSwitched ? _controller.forward() : _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
