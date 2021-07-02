import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

class WiredButtonExample extends StatelessWidget {
  final String title;
  const WiredButtonExample({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WiredButton(
              child: Text('Wired Button'),
              onPressed: () {
                print('Wired Button');
              },
            ),
            SizedBox(height: 50.0),
            WiredButton(
              child: Text('Submit'),
              onPressed: () {
                print('Submit');
              },
            ),
            SizedBox(height: 50.0),
            WiredButton(
              child: Text('Cancel'),
              onPressed: () {
                print('Cancel');
              },
            ),
            SizedBox(height: 50.0),
            WiredButton(
              child: Text('Long text button ...... hah'),
              onPressed: () {
                print('Long text button ...... hah');
              },
            ),
          ],
        ),
      ),
    );
  }
}
