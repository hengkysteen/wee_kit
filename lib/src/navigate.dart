import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum WeeNavigateStyle { auto, material, cupertino }

class WeeNavigate {
  static Future<dynamic> to(
    BuildContext context,
    Widget destination, {
    WeeNavigateStyle style = WeeNavigateStyle.auto,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool removeUntil = false,
    bool replace = false,
    RouteSettings? settings,
  }) {
    late Route route;

    if (style == WeeNavigateStyle.auto) {
      if (kIsWeb) {
        route = PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 200),
          reverseTransitionDuration: Duration(milliseconds: 200),
          settings: settings,
          pageBuilder: (context, _, __) {
            return destination;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, _, Widget child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      } else if (Platform.isIOS) {
        route = CupertinoPageRoute(
          builder: (_) => destination,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );
      } else {
        route = MaterialPageRoute(
          builder: (_) => destination,
          maintainState: maintainState,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );
      }
    }

    if (style == WeeNavigateStyle.material) {
      route = MaterialPageRoute(
        builder: (_) => destination,
        maintainState: maintainState,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    if (style == WeeNavigateStyle.cupertino) {
      route = CupertinoPageRoute(
        builder: (_) => destination,
        maintainState: maintainState,
        settings: settings,
        fullscreenDialog: fullscreenDialog,
      );
    }

    if (removeUntil && replace) {
      throw "removeUntil and replace can\'t be same value";
    }

    if (removeUntil) {
      return Navigator.pushAndRemoveUntil(context, route, (Route<dynamic> r) => false);
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
