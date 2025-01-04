import 'package:flutter/material.dart';
import 'transitions/transition.dart';

class WeeAnimated extends StatefulWidget {
  final Widget child;
  final WeeTransition transition;
  const WeeAnimated({required this.child, required this.transition});
  @override
  State<WeeAnimated> createState() => _WeeAnimatedState();
}

class _WeeAnimatedState extends State<WeeAnimated> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.transition.getDuration(), vsync: this);
    _animation = widget.transition.createAnimation(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return widget.transition.transformWidget(widget.child, _animation.value);
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
