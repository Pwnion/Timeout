import 'package:flutter/material.dart';

@pragma("vm:entry-point")
void createTimerOverlay() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: TimerOverlay(
          time: 5
        )
      )
    )
  );
}


class TimerOverlay extends StatefulWidget {
  final int time;

  const TimerOverlay(
    {
      Key? key,
      required this.time
    }
  ) : super(key: key);

  @override
  State<TimerOverlay> createState() => _TimerOverlayState();
}

class _TimerOverlayState extends State<TimerOverlay> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}