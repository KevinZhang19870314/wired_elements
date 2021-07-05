import 'package:flutter/material.dart';
import 'package:wired_elements/src/canvas/wired_canvas.dart';
import 'package:wired_elements/src/wired_base.dart';

class WiredInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? style;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
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
