import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum WeeNavigateStyle { auto, material, cupertino }

class WeeNavigate {
  static Future<dynamic> to(
    BuildContext context,
    Widget destination, {
    WeeNavigateStyle style = WeeNavigateStyle.auto,
    String? name,
    bool maintainState = true,
    bool full = false,
    bool removeUntil = false,
    bool replace = false,
    RouteSettings? settings,
    Object? arguments,
  }) {
    late Route route;
    if (style == WeeNavigateStyle.auto) {
      if (Platform.isIOS) {
        route = CupertinoPageRoute(
          builder: (_) => destination,
          maintainState: maintainState,
          settings: settings ?? RouteSettings(name: name, arguments: arguments),
          fullscreenDialog: full,
        );
      } else {
        route = MaterialPageRoute(
          builder: (_) => destination,
          maintainState: maintainState,
          settings: settings ?? RouteSettings(name: name, arguments: arguments),
          fullscreenDialog: full,
        );
      }
    }

    if (style == WeeNavigateStyle.material) {
      route = MaterialPageRoute(
        builder: (_) => destination,
        maintainState: maintainState,
        settings: settings ?? RouteSettings(name: name, arguments: arguments),
        fullscreenDialog: full,
      );
    }

    if (style == WeeNavigateStyle.cupertino) {
      route = CupertinoPageRoute(
        builder: (_) => destination,
        maintainState: maintainState,
        settings: settings ?? RouteSettings(name: name, arguments: arguments),
        fullscreenDialog: full,
      );
    }

    if (removeUntil && replace) {
      throw "removeUntil and replace can\'t be same value";
    }

    if (removeUntil) {
      return Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> r) => false);
    } else if (replace) {
      return Navigator.pushReplacement(context, route);
    } else {
      return Navigator.push(context, route);
    }
  }

  static void back<T extends Object>(BuildContext context, [T? result]) {
    return Navigator.pop(context, result);
  }
}
