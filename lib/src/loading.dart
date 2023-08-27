import 'package:flutter/material.dart';

/// A utility class for displaying a loading overlay dialog in a Flutter app.
///
/// To use this class, call the static method `showOverlay()` and pass in a
/// `BuildContext` object and any optional parameters to customize the loading
/// overlay. By default, the loading overlay will prevent the user from closing
/// the dialog by tapping outside of it or using the back button.
class WeeLoading {
  ///
  /// Displays a loading overlay dialog.
  ///
  /// The [context] parameter is required and should be the `BuildContext` of
  /// the widget that is currently being displayed.
  ///
  /// The [disablePop] parameter, if set to `true`, will prevent the user from
  /// closing the dialog by using the back button or tapping outside of it.
  ///
  /// The [barrierColor] parameter can be used to customize the color of the
  /// overlay that appears behind the loading dialog.
  ///
  /// The [customChild] parameter can be used to provide a custom widget to be
  /// displayed in the center of the loading dialog instead of the default
  /// circular progress indicator and loading text.
  ///
  /// The [loadingColor] parameter can be used to change the color of the
  /// circular progress indicator.
  ///
  /// The [loadingText] parameter can be used to customize the text that appears
  /// next to the circular progress indicator.
  ///
  static void showOverlay<T>(
    BuildContext context, {
    bool disablePop = true,
    Color? barrierColor = Colors.black54,
    Widget? customChild,
    Color? loadingColor,
    String loadingText = "Loading ",
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
              child: Center(
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
          ),
        );
      },
    );
  }
}
