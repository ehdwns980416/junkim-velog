import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junkim_velog/utils/logger.dart';

class SystemUIModeScreen extends StatefulWidget {
  const SystemUIModeScreen({super.key});

  @override
  State<SystemUIModeScreen> createState() => _SystemUIModeScreenState();
}

class _SystemUIModeScreenState extends State<SystemUIModeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Set landscape orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    logger.i('Rebuild');

    return Scaffold(
      appBar: AppBar(
        title: const Text('System UI Mode'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text('System UI Mode'),
        ),
      ),
    );
  }
}
