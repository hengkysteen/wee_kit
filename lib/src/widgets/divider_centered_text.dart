import 'package:flutter/material.dart';

class WeeDivider extends StatelessWidget {
  final Widget? child;
  final double indent;
  final double endIndent;
  final Color color;
  const WeeDivider({
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
