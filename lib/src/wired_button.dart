import 'package:flutter/material.dart';
import '../rough/rough.dart';

import 'const.dart';
import 'wired_base.dart';

/// Wired button.
///
/// Usage:
/// ```dart
/// WiredButton(
///  child: WiredText('Wired Button'),
///  onPressed: () {
///   print('Wired Button');
///  },
/// ),
/// ```
class WiredButton extends WiredBaseWidget {
  /// Typically the button's label.
  final Widget child;

  /// Called when the button is tapped
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
