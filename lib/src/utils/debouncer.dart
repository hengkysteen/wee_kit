import 'dart:async';

class WeeDebouncer {
  static Timer? _timer;

  WeeDebouncer._();

  static final WeeDebouncer _instance = WeeDebouncer._();

  factory WeeDebouncer() {
    return _instance;
  }

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

  static void debounce(void Function() callback, {Duration duration = const Duration(milliseconds: 500)}) {
    _timer?.cancel();
    _timer = Timer(duration, callback);
  }
}
