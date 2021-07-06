import 'package:flutter/material.dart';
import '../rough/rough.dart';

import 'const.dart';
import 'wired_base.dart';

class WiredButton extends WiredBaseWidget {
  final Widget child;
  final void Function() onPressed;

  const WiredButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget buildWiredElement() {
    return Container(
      padding: EdgeInsets.zero,
      height: 42.0,
      decoration: RoughBoxDecoration(
        shape: RoughBoxShape.rectangle,
        borderStyle: RoughDrawingStyle(
          width: 1,
          color: borderColor,
        ),
      ),
      child: SizedBox(
        height: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            primary: textColor,
          ),
          child: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
