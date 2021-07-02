import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

class WiredComboExample extends StatelessWidget {
  final String title;
  const WiredComboExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
            child: WiredCombo(
              value: 'One',
              items: ['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((dynamic value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                print('$value');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50.0),
            child: WiredCombo(
              value: 'Banana',
              items: ['Apple', 'Banana', 'Peach', 'Orange', 'Sandwich']
                  .map<DropdownMenuItem<String>>((dynamic value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                print('$value');
              },
            ),
          ),
        ],
      ),
    );
  }
}
