import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkim_velog/constants/gaps.dart';
import 'package:junkim_velog/utils/logger.dart';

class CountdownScreen extends StatefulWidget {
  const CountdownScreen({super.key});

  @override
  State<CountdownScreen> createState() => _CountdownScreenState();
}

class _CountdownScreenState extends State<CountdownScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // final ValueNotifier<Tween<double>> _tween =
  //     ValueNotifier(Tween(begin: 0, end: 1));
  late Animation _rotationAnimation;
  final Color _randomColor =
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _rotationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();

    super.initState();
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    logger.i('build');
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
              // ValueListenableBuilder(
              //   valueListenable: _tween,
              //   builder: (_, tween, __) =>
              // ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (_, __) => Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        value: _rotationAnimation.value,
                        strokeWidth: 5,
                        color: _randomColor,
                      ),
                    ),
                    Text(
                      '${num.parse((5 * (1 - _rotationAnimation.value)).toStringAsFixed(2)).ceil()}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _randomColor,
                      ),
                    ),
                  ],
                ),
              ),
              Gaps.v10,
              CupertinoButton(
                onPressed: () {
                  _animationController.forward(from: 0.0);
                },
                child: Text(
                  'Start',
                  style: TextStyle(
                    color: _randomColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
