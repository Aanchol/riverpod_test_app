import 'dart:async';
import 'dart:ui';

class CustomDebounceWidget {
  Timer? _timer;

  CustomDebounceWidget();

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: 1000), action);
  }
}
