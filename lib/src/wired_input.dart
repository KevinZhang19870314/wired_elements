import 'package:flutter/material.dart';
import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

/// Wired input.
///
/// Usage:
/// ```dart
/// WiredInput(
///   controller: controller1,
///   style: TextStyle(
/// 	fontFamily: handWriting2,
/// 	fontSize: 18.0,
///   ),
///   labelText: 'Name',
///   labelStyle: TextStyle(
/// 	fontFamily: handWriting2,
/// 	fontSize: 18.0,
///   ),
/// ),
/// ```
class WiredInput extends StatelessWidget {
  /// Controls the text being edited.
  final TextEditingController? controller;

  /// The text style for input.
  final TextStyle? style;

  /// Text that describes the input field.
  final String? labelText;

  /// The style to use for the [labelText] when the label is above (i.e.,
  /// vertically adjacent to) the input field.
  final TextStyle? labelStyle;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// The style to use for the [hintText].
  final TextStyle? hintStyle;

  /// Called when the text changes.
  final void Function(String)? onChanged;

  const WiredInput({
    Key? key,
    this.controller,
    this.style,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (labelText != null)
          Text(
            '$labelText',
            style: labelStyle,
          ),
        if (labelText != null) SizedBox(width: 10.0),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: 48.0,
                child: WiredCanvas(
                  painter: WiredRectangleBase(),
                  fillerType: RoughFilter.NoFiller,
                ),
              ),
              TextField(
                controller: controller,
                style: style,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: hintStyle,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
                ),
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ],
    );

    // return Stack(
    //   children: [
    //     SizedBox(
    //       height: 148.0,
    //       width: double.maxFinite,
    //       child: WiredCanvas(
    //         painter: WiredBaseRectangle(leftIndent: 40.0),
    //         fillerType: RoughFilter.NoFiller,
    //       ),
    //     ),
    //     Row(
    //       children: [
    //         Text(
    //           '$labelText',
    //           style: labelStyle,
    //         ),
    //         SizedBox(width: 5.0),
    //         Expanded(
    //           child: TextField(
    //             controller: controller,
    //             style: style,
    //             decoration: InputDecoration(
    //               border: InputBorder.none,
    //               hintText: hintText,
    //               hintStyle: hintStyle,
    //             ),
    //             onChanged: onChanged,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
