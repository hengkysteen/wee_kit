import 'dart:ui';

import 'package:flutter/material.dart';

class WeeShow {
  ///  [position] use `GestureDetector` to get details
  ///
  /// Example :  details.globalPosition
  static Future<int?> contextualMenu({
    required BuildContext context,
    required Offset position,
    required List<PopupMenuItem<int>> items,
    Color? color,
    BoxConstraints? constraints,
  }) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final positionRect = RelativeRect.fromLTRB(position.dx, position.dy, overlay.size.width - position.dx, overlay.size.height - position.dy);
    return await showMenu(
      color: color,
      context: context,
      position: positionRect,
      constraints: constraints ?? BoxConstraints(maxWidth: 150, minWidth: 150),
      items: items,
      menuPadding: EdgeInsets.zero,
    );
  }

  static void snackBar(BuildContext context, String msg, {int seconds = 1}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), duration: Duration(seconds: seconds)));
  }

  static void bluredDialog({
    required BuildContext context,
    required Widget child,
    double verticalSpace = 60,
    EdgeInsetsGeometry? margin,
    double maxWidth = 800
  }) {
    showDialog(
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Stack(
          children: [
            BackdropFilter(filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3, tileMode: TileMode.decal), child: const Center()),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: verticalSpace),
                width: maxWidth,
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Card(
                  margin: margin,
                  elevation: 3,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.7, color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  borderOnForeground: true,
                  child: child,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  static void loadingOverlay<T>(
    BuildContext context, {
    bool canPop = true,
    Color? barrierColor = Colors.black54,
    Widget? customChild,
    Color? loadingColor,
    String loadingText = "Loading ",
    Widget? child,
  }) async {
    return showDialog(
      barrierColor: barrierColor,
      useRootNavigator: false,
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: canPop,
          child: Material(
            color: Colors.transparent,
            child: child ??
                Center(
                  child: customChild ??
                      AlertDialog(
                        content: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(loadingText, style: TextStyle(fontWeight: FontWeight.w500)),
                            SizedBox(width: 10),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                valueColor: AlwaysStoppedAnimation<Color>(loadingColor ?? Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
          ),
        );
      },
    );
  }
}
