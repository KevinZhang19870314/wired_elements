import 'package:flutter/material.dart';
import '../rough/rough.dart';
import 'wired_base.dart';

import 'canvas/wired_canvas.dart';

/// Wired combo
///
/// Usage:
/// ```dart
/// WiredCombo(
///   value: 'One',
///   items: ['One', 'Two', 'Free', 'Four']
/// 	  .map<DropdownMenuItem<String>>((dynamic value) {
/// 	return DropdownMenuItem<String>(
/// 	  value: value,
/// 	  child: Padding(
/// 		padding: EdgeInsets.only(left: 5.0),
/// 		child: WiredText(value),
/// 	  ),
/// 	);
///   }).toList(),
///   onChanged: (value) {
/// 	print('$value');
///   },
/// ),
/// ```
class WiredCombo extends StatefulWidget {
  /// The selected value for combo.
  final dynamic value;

  /// The selection items for combo.
  final List<DropdownMenuItem<dynamic>> items;

  /// Called when the combo selected value changed.
  final Function(dynamic)? onChanged;

  const WiredCombo({
    Key? key,
    required this.items,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _WiredComboState createState() => _WiredComboState();
}

class _WiredComboState extends State<WiredCombo> {
  double _height = 60.0;
  dynamic _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return _buildWidget();
  }

  Widget _buildWidget() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: _height,
      child: Stack(
        children: [
          Positioned(
            right: 10.0,
            top: 20.0,
            child: WiredCanvas(
              painter: WiredInvertedTriangleBase(),
              fillerType: RoughFilter.HachureFiller,
              fillerConfig: FillerConfig.build(hachureGap: 2),
              size: Size(18.0, 18.0),
            ),
          ),
          SizedBox(
            height: _height,
            width: double.infinity,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                itemHeight: _height,
                isExpanded: true,
                elevation: 0,
                icon: Visibility(
                  visible: false,
                  child: Icon(Icons.arrow_downward),
                ),
                value: _value,
                items: widget.items.map((item) {
                  return DropdownMenuItem<dynamic>(
                    value: item.value,
                    child: Stack(
                      children: [
                        WiredCanvas(
                          painter: WiredRectangleBase(),
                          fillerType: RoughFilter.NoFiller,
                          size: Size(double.infinity, _height),
                        ),
                        Positioned(
                          top: 20.0,
                          child: item.child,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (dynamic value) {
                  _value = value;
                  if (widget.onChanged != null) {
                    widget.onChanged!(_value);
                  }

                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
