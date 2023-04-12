import 'package:flutter/material.dart';

class WeeLoading {
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
                          Text(
                           loadingText,
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
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
