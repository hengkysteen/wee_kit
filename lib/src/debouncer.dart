import 'dart:async';

class WeeDebouncer {
  static Timer? _timer;

  /// Executes the specified [callback] immediately, and then debounces
  /// subsequent calls to the same function until the specified [duration]
  /// has elapsed.
  ///
  /// If a debounced call is made before the [duration] has elapsed, the timer
  /// is reset and the callback is not executed until the timer has elapsed
  /// again.
  static void executeOnce(void Function() callback, {Duration duration = const Duration(milliseconds: 500)}) {
    if (_timer?.isActive ?? false) {
      _timer!.cancel();
    } else {
      callback();
    }
    _timer = Timer(duration, () {
      _timer = null;
    });
  }

  /// Debounces the specified [callback] until the specified [duration]
  /// has elapsed.
  ///
  /// If a debounced call is made before the [duration] has elapsed, the timer
  /// is reset and the callback is not executed until the timer has elapsed
  /// again.
  static void debounce(void Function() callback, {Duration duration = const Duration(milliseconds: 500)}) {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }
}
