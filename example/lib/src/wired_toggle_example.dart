import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredToggleExample extends StatelessWidget {
  final String title;
  const WiredToggleExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _firstVal = false;
    bool _secondVal = true;

    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          '$title',
          fontSize: 20.0,
        ),
      ),
      body: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WiredToggle(
              value: _firstVal,
              onChange: (val) {
                print(val);

                return false;
              },
            ),
            SizedBox(height: 50.0),
            WiredToggle(
              value: _secondVal,
              onChange: (val) {
                print(val);

                return true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
