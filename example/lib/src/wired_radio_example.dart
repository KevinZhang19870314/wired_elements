import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredRadioExample extends StatefulWidget {
  final String title;
  const WiredRadioExample({Key? key, required this.title}) : super(key: key);

  @override
  _WiredRadioExampleState createState() => _WiredRadioExampleState();
}

class _WiredRadioExampleState extends State<WiredRadioExample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          '${widget.title}',
          fontSize: 20.0,
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 15.0),
          ListTile(
            title: const Text('Lafayette'),
            leading: WiredRadio<SingingCharacter>(
              value: SingingCharacter.lafayette,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                print('$value');
                setState(() {
                  _character = value;
                });

                return true;
              },
            ),
          ),
          ListTile(
            title: const Text('Thomas Jefferson'),
            leading: WiredRadio<SingingCharacter>(
              value: SingingCharacter.jefferson,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                print('$value');
                setState(() {
                  _character = value;
                });

                return true;
              },
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { lafayette, jefferson }
