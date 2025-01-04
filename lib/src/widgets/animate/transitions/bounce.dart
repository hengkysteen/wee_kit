import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'transition.dart';

class WeeBouncingTransition implements WeeTransition {
  final BounceDirection direction;
  final Duration duration;
  final double intensity;
  final Curve curve;

  const WeeBouncingTransition({
    this.direction = BounceDirection.bottom,
    this.duration = const Duration(seconds: 1),
    this.intensity = 1.0,
    this.curve = Curves.elasticOut,
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
      case BounceDirection.top:
        return _createVerticalTransform(child, animationValue, -1);
      case BounceDirection.bottom:
        return _createVerticalTransform(child, animationValue, 1);
      case BounceDirection.left:
        return _createHorizontalTransform(child, animationValue, -1);
      case BounceDirection.right:
        return _createHorizontalTransform(child, animationValue, 1);
      case BounceDirection.center:
        return _createCenterTransform(child, animationValue);
    }
  }

  Widget _createVerticalTransform(Widget child, double value, int direction) {
    double translateY = direction * 100 * math.sin(value * math.pi) * intensity;
    return Transform.translate(
      offset: Offset(0, translateY),
      child: child,
    );
  }

  Widget _createHorizontalTransform(Widget child, double value, int direction) {
    double translateX = direction * 100 * math.sin(value * math.pi) * intensity;
    return Transform.translate(
      offset: Offset(translateX, 0),
      child: child,
    );
  }

  Widget _createCenterTransform(Widget child, double value) {
    double scale = 1.0 - (math.sin(value * math.pi) * 0.1);
    return Transform.scale(
      scale: scale,
      alignment: Alignment.center,
      child: child,
    );
  }

  @override
  Duration getDuration() {
    return duration;
  }
}

enum BounceDirection { top, bottom, left, right, center }
