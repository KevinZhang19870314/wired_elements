import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredCalendarExample extends StatefulWidget {
  final String title;
  const WiredCalendarExample({Key? key, required this.title}) : super(key: key);

  @override
  _WiredCalendarExampleState createState() => _WiredCalendarExampleState();
}

class _WiredCalendarExampleState extends State<WiredCalendarExample> {
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
        color: Colors.grey.shade200,
        padding: EdgeInsets.all(15.0),
        height: 460.0,
        child: WiredCalendar(
          selected: '20210722',
          onSelected: (value) {
            print('Selected date: $value');
          },
        ),
      ),
    );
  }
}
