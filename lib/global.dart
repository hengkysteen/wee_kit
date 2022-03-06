import 'package:flutter/material.dart';

class WeeGlobal {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  static BuildContext get context => key.currentContext;
}
