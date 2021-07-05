import 'package:flutter/material.dart';
import 'package:wired_elements/rough/rough.dart';
import 'package:wired_elements/src/const.dart';

import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

class WiredSlider extends StatefulWidget {
  final double value;
  final int? divisions;
  final String? label;
  final double min;
  final double max;
  final bool Function(double)? onChanged;

  const WiredSlider({
    Key? key,
    required this.value,
    this.divisions,
    this.label,
    this.min = 0.0,
    this.max = 1.0,
    required this.onChanged,
  }) : super(key: key);

  @override
  _WiredSliderState createState() => _WiredSliderState();
}

class _WiredSliderState extends State<WiredSlider> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.value;

    // Delay for calculate the slider's width `_getSliderWidth()` during the next frame
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
              strokeWidth: 2,
            ),
            fillerType: RoughFilter.HatchFiller,
          ),
        ),
        Positioned(
          left: _getSliderWidth() * _currentSliderValue / widget.max - 12,
          child: SizedBox(
            height: 24.0,
            width: 24.0,
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
        SliderTheme(
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            value: _currentSliderValue,
            min: widget.min,
            max: widget.max,
            activeColor: Colors.transparent,
            inactiveColor: Colors.transparent,
            divisions: widget.divisions,
            label: widget.label,
            onChanged: (value) {
              bool result = false;
              if (widget.onChanged != null) {
                result = widget.onChanged!(value);
              }

              if (result) {
                setState(() {
                  _currentSliderValue = value;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  double _getSliderWidth() {
    double width = 0;
    try {
      var box = context.findRenderObject() as RenderBox;
      width = box.size.width;
    } catch (e) {}

    return width;
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
