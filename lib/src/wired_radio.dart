import 'package:flutter/material.dart';
import '../rough/rough.dart';
import 'const.dart';
import 'wired_base.dart';

import 'canvas/wired_canvas.dart';

/// Wired radio.
///
/// Usage:
/// ```dart
/// ListTile(
/// title: const Text('Lafayette'),
/// leading: WiredRadio<SingingCharacter>(
///   value: SingingCharacter.lafayette,
///   groupValue: _character,
///   onChanged: (SingingCharacter? value) {
/// 	print('$value');
/// 	setState(() {
/// 	  _character = value;
/// 	});
///
/// 	return true;
///   },
/// ),
/// ),
/// ```
class WiredRadio<T> extends StatefulWidget {
  /// The value for radio.
  final T value;

  /// The current group radios value.
  final T? groupValue;

  /// Called when the radio value changes.
  final bool Function(T?)? onChanged;

  const WiredRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _WiredRadioState<T> createState() => _WiredRadioState<T>();
}

class _WiredRadioState<T> extends State<WiredRadio<T>> {
  bool _isSelected = false;
  T? _groupValue;

  @override
  Widget build(BuildContext context) {
    _groupValue = widget.groupValue;
    _isSelected = _groupValue == widget.value;
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            height: 48.0,
            width: 48.0,
            child: WiredCanvas(
              painter: WiredCircleBase(diameterRatio: .7),
              fillerType: RoughFilter.NoFiller,
            ),
          ),
        ),
        if (_isSelected)
          Positioned(
            left: 12,
            top: 12,
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
        Radio<T>(
          value: widget.value,
          groupValue: widget.groupValue,
          fillColor: MaterialStateProperty.all(Colors.transparent),
          onChanged: (value) {
            if (widget.onChanged != null) {
              _isSelected = widget.onChanged!(value);
              if (_isSelected) {
                _groupValue = value;
              }
            }
          },
        ),
      ],
    );
  }
}
