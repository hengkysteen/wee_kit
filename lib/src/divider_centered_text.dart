import 'package:flutter/material.dart';

/// A widget that displays a horizontal line with centered text in the middle.
///
/// This widget is useful for creating section headings or dividing content
/// into sections. It consists of a horizontal line that is split into two
/// sections with a centered text widget in the middle. The color, indent,
/// and endIndent of the line can be customized using the `color`, `indent`,
/// and `endIndent` parameters, respectively.
///
/// To use this widget, simply create a new instance of `WeeDividerCenteredText`
/// and pass in the desired `child` widget to be displayed in the center.
class WeeDividerCenteredText extends StatelessWidget {
  /// The child widget to be displayed in the center of the divider.
  final Widget? child;

  /// The amount of space to indent the left side of the divider.
  final double indent;

  /// The amount of space to indent the right side of the divider.
  final double endIndent;

  /// The color of the divider line.
  final Color color;

  const WeeDividerCenteredText({
    Key? key,
    this.child,
    this.indent = 20,
    this.endIndent = 20,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(child: Divider(indent: indent, color: color)),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: child),
            Expanded(child: Divider(endIndent: endIndent, color: color)),
          ],
        ),
      ],
    );
  }
}
