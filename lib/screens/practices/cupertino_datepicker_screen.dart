import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// https://velog.io/@end75814/flutter-Cupertino-datepicker-한글화
class CupertinoDatepickerScreen extends StatelessWidget {
  const CupertinoDatepickerScreen({super.key});

  void _onPickerChanged(DateTime date) {
    final textDate = date.toString().split(' ').first;
    print(textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Datepicker'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SizedBox(
            width: 400,
            height: 300,
            child: CupertinoDatePicker(
              minimumYear: 1900,
              maximumYear: DateTime.now().year,
              initialDateTime: DateTime.now(),
              maximumDate: DateTime.now(),
              // dateOrder: DatePickerDateOrder.ymd,
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              onDateTimeChanged: _onPickerChanged,
            ),
          ),
        ),
      ),
    );
  }
}
