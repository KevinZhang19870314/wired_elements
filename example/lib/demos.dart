import 'package:example/src/wired_card_example.dart';
import 'package:example/src/wired_checkbox_example.dart';
import 'package:example/src/wired_combo_example.dart';
import 'package:example/src/wired_dialog_example.dart';
import 'package:example/src/wired_divider_example.dart';
import 'package:flutter/material.dart';
import 'src/wired_button_example.dart';

final List<Demo> demos = [
  NormalDemo(
    'Wired button example',
    'Wired button, Submit button, Long text button...',
    (_) => WiredButtonExample(title: 'Wired button example'),
    const Icon(Icons.smart_button, size: 36),
  ),
  NormalDemo(
    'Wired card example',
    'Wired card',
    (_) => WiredCardExample(title: 'Wired card'),
    const Icon(Icons.card_giftcard, size: 36),
  ),
  NormalDemo(
    'Wired checkbox example',
    'Wired checkbox',
    (_) => WiredCheckboxExample(title: 'Wired checkbox'),
    const Icon(Icons.check_box, size: 36),
  ),
  NormalDemo(
    'Wired combo example',
    'Wired combo',
    (_) => WiredComboExample(title: 'Wired combo'),
    const Icon(Icons.arrow_drop_down, size: 36),
  ),
  NormalDemo(
    'Wired dialog example',
    'Wired dialog',
    (_) => WiredDialogExample(title: 'Wired dialog'),
    const Icon(Icons.open_with, size: 36),
  ),
  NormalDemo(
    'Wired divider example',
    'Wired divider',
    (_) => WiredDividerExample(title: 'Wired divider'),
    const Icon(Icons.safety_divider, size: 36),
  )
];

abstract class Demo {
  final String name;
  final String description;
  final Widget icon;

  Demo(this.name, this.description, this.icon, {Key? key});

  Widget buildPage(BuildContext context);
}

class NormalDemo extends Demo {
  final WidgetBuilder builder;
  NormalDemo(String name, String description, this.builder, Widget icon)
      : super(name, description, icon);

  @override
  Widget buildPage(BuildContext context) {
    return builder(context);
  }
}
