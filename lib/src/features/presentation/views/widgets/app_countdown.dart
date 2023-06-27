import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTime extends StatefulWidget {
  const CountDownTime({super.key});

  @override
  State<CountDownTime> createState() => _CountDownTimeState();
}

class _CountDownTimeState extends State<CountDownTime> {
  Timer? _timer;
  int _start = 55;

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Column(
      children: <Widget>[Text('$_start')],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}
