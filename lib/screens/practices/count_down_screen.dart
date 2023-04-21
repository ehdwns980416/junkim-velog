import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkim_velog/constants/gaps.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  final Color _randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onStart() {
    if (!controller.isAnimating) {
      controller.value = 0;
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countdown Timer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      value: 1 - controller.value,
                      semanticsLabel: 'Circular progress indicator',
                      strokeWidth: 5,
                      color: _randomColor,
                    ),
                  ),
                  Text(
                    '${num.parse((5 * (1 - controller.value)).toStringAsFixed(2)).ceil()}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _randomColor,
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              CupertinoButton(
                  onPressed: _onStart,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      color: _randomColor,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
