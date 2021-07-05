import 'package:example/demos.dart';
import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredInputExample extends StatelessWidget {
  final String title;
  const WiredInputExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller1 =
        TextEditingController(text: 'Hello wired input');
    final TextEditingController controller2 = TextEditingController();
    final TextEditingController controller3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          '$title',
          fontSize: 20.0,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WiredInput(
              controller: controller1,
              style: TextStyle(
                fontFamily: handWriting2,
                fontSize: 18.0,
              ),
              labelText: 'Name',
              labelStyle: TextStyle(
                fontFamily: handWriting2,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 15.0),
            WiredInput(
              controller: controller2,
              labelText: 'User Email',
              labelStyle: TextStyle(
                fontFamily: handWriting2,
                fontSize: 18.0,
              ),
              style: TextStyle(
                fontFamily: handWriting2,
              ),
              hintText: 'Please enter user email',
            ),
            SizedBox(height: 15.0),
            WiredInput(
              controller: controller3,
              style: TextStyle(
                fontFamily: handWriting2,
              ),
              hintText: 'Your age please!',
            ),
          ],
        ),
      ),
    );
  }
}
