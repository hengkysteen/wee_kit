import 'package:flutter/material.dart';
import 'transition.dart';

class WeeFadeTransition implements WeeTransition {
  final Duration duration;
  final Curve curve;

  const WeeFadeTransition({
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeInOut,
  });

  @override
  Animation<double> createAnimation(AnimationController controller) {
    return Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: curve),
    );
  }

  @override
  Widget transformWidget(Widget child, double animationValue) {
    return Opacity(
      opacity: animationValue,
      child: child,
    );
  }

  @override
  Duration getDuration() {
    return duration;
  }
}
