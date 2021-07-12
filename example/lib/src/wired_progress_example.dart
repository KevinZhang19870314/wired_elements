import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredProgressExample extends StatefulWidget {
  final String title;
  const WiredProgressExample({Key? key, required this.title}) : super(key: key);

  @override
  _WiredProgressExampleState createState() => _WiredProgressExampleState();
}

class _WiredProgressExampleState extends State<WiredProgressExample>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final _controller1 = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    final _controller2 = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          '${widget.title}',
          fontSize: 20.0,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WiredProgress(controller: _controller1, value: 0.5),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ..._example(_controller1),
              ],
            ),
            SizedBox(height: 50.0),
            WiredProgress(controller: _controller2),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ..._example(_controller2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _example(AnimationController controller) {
    return [
      WiredButton(
        child: Text('Start'),
        onPressed: () {
          controller.forward();
        },
      ),
      SizedBox(width: 20.0),
      WiredButton(
        child: Text('Stop'),
        onPressed: () {
          controller.stop();
        },
      ),
      SizedBox(width: 20.0),
      WiredButton(
        child: Text('Reset'),
        onPressed: () {
          controller.reset();
        },
      ),
    ];
  }
}
