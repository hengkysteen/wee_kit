import 'package:flutter/material.dart';

// Abstract class for animated transitions
abstract class WeeTransition {
  // Method to create the animation
  Animation<double> createAnimation(AnimationController controller);

  // Method to transform the widget
  Widget transformWidget(Widget child, double animationValue);

  Duration getDuration();
}
