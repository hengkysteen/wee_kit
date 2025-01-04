import 'package:flutter/material.dart';

import 'transition.dart';

class WeeSlideTransition implements WeeTransition {
  final WeeSlideTransitionDirection direction;
  final Duration duration;
  final double intensity;
  final Curve curve;

  const WeeSlideTransition({
    this.direction = WeeSlideTransitionDirection.right,
    this.duration = const Duration(seconds: 1),
    this.intensity = 1.0,
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
    switch (direction) {
      case WeeSlideTransitionDirection.top:
        return _createVerticalTransform(child, animationValue, -1);
      case WeeSlideTransitionDirection.bottom:
        return _createVerticalTransform(child, animationValue, 1);
      case WeeSlideTransitionDirection.left:
        return _createHorizontalTransform(child, animationValue, -1);
      case WeeSlideTransitionDirection.right:
        return _createHorizontalTransform(child, animationValue, 1);
    }
  }

  Widget _createVerticalTransform(Widget child, double value, int direction) {
    double translateY = direction * 100 * (1 - value) * intensity;
    return Transform.translate(
      offset: Offset(0, translateY),
      child: child,
    );
  }

  Widget _createHorizontalTransform(Widget child, double value, int direction) {
    double translateX = direction * 100 * (1 - value) * intensity;
    return Transform.translate(
      offset: Offset(translateX, 0),
      child: child,
    );
  }

  @override
  Duration getDuration() {
    return duration;
  }
}

enum WeeSlideTransitionDirection { top, bottom, left, right }
