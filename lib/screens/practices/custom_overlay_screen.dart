import 'dart:async';

import 'package:flutter/material.dart';
import 'package:junkim_velog/utils/logger.dart';

class CustomOverlayScreen extends StatefulWidget {
  const CustomOverlayScreen({super.key});

  @override
  State<CustomOverlayScreen> createState() => _CustomOverlayScreenState();
}

class _CustomOverlayScreenState extends State<CustomOverlayScreen> {
  final ValueNotifier<bool> _isVisible = ValueNotifier(false);
  final ValueNotifier<bool> _isOpaque = ValueNotifier(false);

  Timer? _timer;
  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay with Animate'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: TextButton(
                onPressed: () {
                  _cancelTimer();
                  _isVisible.value = true;

                  Future.delayed(const Duration(milliseconds: 500), () {
                    _timer = Timer(
                      const Duration(milliseconds: 2500),
                      () {
                        logger.i('dispose!');
                        _isVisible.value = false;
                      },
                    );
                  });
                },
                child: const Text('Show Overlay'),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _isVisible,
            builder: (_, visible, __) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: visible
                  ? GestureDetector(
                      onTap: () {
                        _cancelTimer();
                        _isVisible.value = false;
                      },
                      child: Container(
                        key: ValueKey<bool>(visible),
                        color: Colors.black26,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
