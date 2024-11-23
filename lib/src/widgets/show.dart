import 'package:flutter/material.dart';

/// A utility class for managing and displaying various UI components in Flutter.
///
/// The `WeeShow` class is designed to centralize and simplify the process of
/// displaying contextual menus, dialogs, and other UI elements that require
/// dynamic positioning or user interaction.
class WeeShow {
  static Future<int?> contextualMenu({
    required BuildContext context,
    required LongPressStartDetails longPressStartDetails,
    required List<PopupMenuItem<int>> items,
    Color? color,
    BoxConstraints? constraints,
  }) async {
    // Get the overlay's render box for calculating the menu's position.
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    // Determine the position of the popup menu relative to the long-press location.
    final position = RelativeRect.fromLTRB(
      longPressStartDetails.globalPosition.dx,
      longPressStartDetails.globalPosition.dy,
      overlay.size.width - longPressStartDetails.globalPosition.dx,
      overlay.size.height - longPressStartDetails.globalPosition.dy,
    );

    // Show the popup menu and return the selected item's value.
    return await showMenu(
      color: color,
      context: context,
      position: position,
      constraints: constraints ?? BoxConstraints(maxWidth: 150, minWidth: 150),
      items: items,
      menuPadding: EdgeInsets.zero,
    );
  }

  static void snackBar(BuildContext context, String msg, {int seconds = 1}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), duration: Duration(seconds: seconds)));
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
        return Builder(builder: (context) {
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
        });
      },
    );
  }
}
