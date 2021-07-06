import 'package:flutter/material.dart';
import 'wired_base.dart';

import 'canvas/wired_canvas.dart';

/// Wired dialog.
///
/// Usage:
/// ```dart
/// WiredButton(
/// 	onPressed: () {
/// 	  showDialog(
/// 		context: context,
/// 		builder: (context) {
/// 		  return Center(
/// 			child: Container(
/// 			  height: 480.0,
/// 			  child: WiredDialog(
/// 				child: Column(
/// 				  crossAxisAlignment: CrossAxisAlignment.start,
/// 				  children: [
/// 					WiredText(
/// 					  'Title',
/// 					  fontSize: 20.0,
/// 					  fontWeight: FontWeight.bold,
/// 					),
/// 					SizedBox(height: 15.0),
/// 					WiredText(
/// 					  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
/// 					),
/// 					SizedBox(height: 15.0),
/// 					Row(
/// 					  mainAxisAlignment: MainAxisAlignment.end,
/// 					  children: [
/// 						WiredButton(
/// 						  child: Text('OK'),
/// 						  onPressed: () {
/// 							Navigator.of(context).pop();
/// 						  },
/// 						),
/// 					  ],
/// 					),
/// 				  ],
/// 				),
/// 			  ),
/// 			),
/// 		  );
/// 		},
/// 	  );
/// 	},
/// 	child: WiredText('Open wired dialog'),
///   ),
/// ```
class WiredDialog extends StatelessWidget {
  /// The content in dialog.
  final Widget child;

  /// The padding for dialog's content, defaults to 20.0 if null.
  final EdgeInsetsGeometry? padding;

  const WiredDialog({
    Key? key,
    required this.child,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: WiredCanvas(
              painter: WiredRectangleBase(),
              fillerType: RoughFilter.NoFiller,
            ),
          ),
          Padding(
            padding: padding ?? EdgeInsets.all(20.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
