import 'package:flutter/material.dart';
import 'canvas/wired_canvas.dart';
import 'wired_base.dart';

/// Wired card.
///
/// Usage:
/// ```dart
/// WiredCard(
///   height: 150.0,
///   fill: false,
///   child: Column(
/// 	mainAxisSize: MainAxisSize.min,
/// 	children: <Widget>[
/// 	  const ListTile(
/// 		leading: Icon(Icons.album),
/// 		title: WiredText('The Enchanted Nightingale'),
/// 		subtitle: WiredText(
/// 			'Music by Julie Gable. Lyrics by Sidney Stein.'),
/// 	  ),
/// 	  Row(
/// 		mainAxisAlignment: MainAxisAlignment.end,
/// 		children: <Widget>[
/// 		  WiredButton(
/// 			child: const WiredText('BUY TICKETS'),
/// 			onPressed: () {/* ... */},
/// 		  ),
/// 		  const SizedBox(width: 8),
/// 		  WiredButton(
/// 			child: const WiredText('LISTEN'),
/// 			onPressed: () {/* ... */},
/// 		  ),
/// 		  const SizedBox(width: 8),
/// 		],
/// 	  ),
/// 	],
///   ),
/// ),
/// ```
class WiredCard extends StatelessWidget {
  /// The [child] contained by the card.
  final Widget? child;

  /// [true] to fill by canvas fill painter, otherwise not.
  final bool fill;

  /// The [height] of this card.
  final double? height;

  const WiredCard({
    Key? key,
    this.child,
    this.fill = false,
    this.height = 130.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      height: height,
      child: Stack(
        children: [
          WiredCanvas(
            painter: WiredRectangleBase(),
            fillerType: fill ? RoughFilter.HachureFiller : RoughFilter.NoFiller,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Card(
                  color: Colors.transparent,
                  shadowColor: Colors.transparent,
                  child: child,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
