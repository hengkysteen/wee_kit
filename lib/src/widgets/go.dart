import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart' show CupertinoPageTransition;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class WeeGo {
  static Future<void> to(
    BuildContext context, {
    Widget? target,
    String? routeName,
    WeeGoStyle style = WeeGoStyle.auto,
    Duration transitionDuration = const Duration(milliseconds: 300),
    Duration reverseTransitionDuration = const Duration(milliseconds: 200),
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? customTransition,
    bool replace = false,
    bool removeUntil = false,
    RoutePredicate? removeUntilPredicate,
  }) async {
    if (routeName != null && routeName.isNotEmpty) {
      _navigateWithRouteName(context, routeName, style, replace, removeUntil, removeUntilPredicate);
    } else if (target != null) {
      _navigateWithTarget(context, target, style, transitionDuration, reverseTransitionDuration, customTransition, replace, removeUntil, removeUntilPredicate);
    } else {
      throw ArgumentError('Either target or routeName must be provided.');
    }
  }

  static void back<T>(BuildContext context, [T? result]) {
    Navigator.pop(context, result);
  }

  static void _navigateWithTarget(
    BuildContext context,
    Widget target,
    WeeGoStyle style,
    Duration transitionDuration,
    Duration reverseTransitionDuration,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? customTransition,
    bool replace,
    bool removeUntil,
    RoutePredicate? removeUntilPredicate,
  ) {
    PageRouteBuilder pageRouteBuilder = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => target,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
      transitionDuration: transitionDuration,
      reverseTransitionDuration: reverseTransitionDuration,
    );

    switch (style) {
      case WeeGoStyle.fade:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => target,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
        );
        break;
      case WeeGoStyle.custom:
        if (customTransition != null) {
          pageRouteBuilder = PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => target,
            transitionsBuilder: customTransition,
            transitionDuration: transitionDuration,
            reverseTransitionDuration: reverseTransitionDuration,
          );
        } else {
          throw ArgumentError('Custom transitions require a `customTransition` parameter.');
        }
        break;
      case WeeGoStyle.material:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => target,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.0, 0.0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          },
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
        );
        break;
      case WeeGoStyle.cupertino:
        pageRouteBuilder = PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => target,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return CupertinoPageTransition(
              primaryRouteAnimation: animation,
              secondaryRouteAnimation: secondaryAnimation,
              linearTransition: true,
              child: child,
            );
          },
          transitionDuration: transitionDuration,
          reverseTransitionDuration: reverseTransitionDuration,
        );
        break;
      case WeeGoStyle.auto:
        style = _defaultNavigationStyle();
        break;
    }

    if (removeUntil) {
      Navigator.pushAndRemoveUntil(
        context,
        pageRouteBuilder,
        removeUntilPredicate ?? (Route<dynamic> route) => false,
      );
    } else {
      if (replace) {
        Navigator.pushReplacement(context, pageRouteBuilder);
      } else {
        Navigator.push(context, pageRouteBuilder);
      }
    }
  }

  static void _navigateWithRouteName(
    BuildContext context,
    String routeName,
    WeeGoStyle style,
    bool replace,
    bool removeUntil,
    RoutePredicate? removeUntilPredicate,
  ) {
    if (removeUntil) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        removeUntilPredicate ?? (Route<dynamic> route) => false,
      );
    } else {
      if (replace) {
        Navigator.pushReplacementNamed(context, routeName);
      } else {
        Navigator.pushNamed(context, routeName);
      }
    }
  }

  static WeeGoStyle _defaultNavigationStyle() {
    if (kIsWeb) {
      return WeeGoStyle.fade;
    } else if (Platform.isIOS) {
      return WeeGoStyle.cupertino;
    } else if (Platform.isAndroid) {
      return WeeGoStyle.material;
    } else {
      return WeeGoStyle.fade;
    }
  }
}

enum WeeGoStyle { auto, material, cupertino, fade, custom }
