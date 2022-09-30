import 'package:flutter/material.dart';

class WeeOverlays {
  static Future<T?> show<T>(
    BuildContext context, {
    bool disablePop = true,
    Color? barrierColor,
    Widget? child,
    Color loadingColor = Colors.white,
  }) async {
    return showDialog(
      barrierColor: barrierColor,
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Builder(
          builder: (context) => WillPopScope(
            onWillPop: !disablePop ? null : () async => Future.value(false),
            child: Material(
              color: Colors.transparent,
              child: child ??
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(loadingColor),
                      ),
                    ),
                  ),
            ),
          ),
        );
      },
    );
  }

  static void hide(BuildContext context) {
    return Navigator.pop(context);
  }
}
