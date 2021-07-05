import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredSliderExample extends StatefulWidget {
  final String title;
  const WiredSliderExample({Key? key, required this.title}) : super(key: key);

  @override
  _WiredSliderExampleState createState() => _WiredSliderExampleState();
}

class _WiredSliderExampleState extends State<WiredSliderExample> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          '${widget.title}',
          fontSize: 20.0,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        height: 200.0,
        child: WiredSlider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 5,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            print('$_currentSliderValue');
            return true;
          },
        ),
      ),
    );
  }
}
