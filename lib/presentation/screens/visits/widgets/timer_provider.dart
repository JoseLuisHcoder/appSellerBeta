import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerProvider extends ChangeNotifier {
  int _seconds = 0;
  Timer? _timer;

  int get seconds => _seconds;

  set seconds(int value) {
    _seconds = value;
    notifyListeners();
  }

  void setSeconds(int seconds) {
    _seconds = seconds;
    notifyListeners();
  }

  void incrementSeconds() {
    _seconds++;
    notifyListeners();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      _seconds++;
      incrementSeconds();
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }
}
