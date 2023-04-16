import 'package:flutter/material.dart';

class WeeGlobalNavState {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  static BuildContext? get context => key.currentContext;
  static NavigatorState? get state => key.currentState;
}
