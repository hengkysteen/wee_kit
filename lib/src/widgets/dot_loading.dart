import 'dart:async' show Timer;
import 'package:flutter/material.dart';

class WeeDotLoading extends StatefulWidget {
  final int intervalMilliseconds;
  final int dotLength;
  const WeeDotLoading({this.intervalMilliseconds = 1000, this.dotLength = 3});

  @override
  State<WeeDotLoading> createState() => _WeeDotLoadingState();
}

class _WeeDotLoadingState extends State<WeeDotLoading> {
  late Timer _timer;
  int _dotCount = 0;
  late String _dots;

  @override
  void initState() {
    super.initState();
    _dotCount = 1;
    _dots = '. ' * _dotCount;
    _startDotAnimation();
  }

  void _startDotAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: widget.intervalMilliseconds), (_) {
      setState(() {
        _dotCount = (_dotCount % widget.dotLength) + 1;
        _dots = '. ' * _dotCount;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_dots, style: const TextStyle(fontWeight: FontWeight.bold));
    // return Baseline(
    //   baseline: 7,
    //   baselineType: TextBaseline.ideographic,
    //   child: Text(_dots, style: const TextStyle(fontWeight: FontWeight.bold)),
    // );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
