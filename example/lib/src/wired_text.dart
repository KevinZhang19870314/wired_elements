import 'package:example/demos.dart';
import 'package:flutter/material.dart';

class WiredText extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;

  const WiredText(
    this.data, {
    Key? key,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 18.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontFamily: handWriting2,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
