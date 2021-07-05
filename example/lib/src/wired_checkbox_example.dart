import 'package:example/src/wired_text.dart';
import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

class WiredCheckboxExample extends StatelessWidget {
  final String title;
  const WiredCheckboxExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          '$title',
          fontSize: 20.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WiredCheckbox(
              value: false,
              onChanged: (value) {
                print('Wired Checkbox $value');
              },
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                WiredCheckbox(
                  value: true,
                  onChanged: (value) {
                    print('Labeled Wired Checkbox $value');
                  },
                ),
                SizedBox(width: 5.0),
                WiredText('Terms & Privacy'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
