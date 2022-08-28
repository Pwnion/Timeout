import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:installed_apps/installed_apps.dart';


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
  void _onEnd() {
    FlutterOverlayWindow.closeOverlay();
    InstalledApps.startApp('com.example.timeout');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.purple
      ),
      child: Center(
        child: CountdownTimer(
          endTime: DateTime.now().millisecondsSinceEpoch + 30 * 1000,
          widgetBuilder: (_, final CurrentRemainingTime? time) {
            if(time == null) {
              return const Text('');
            }

            return Text(
              '${time.sec}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            );
          },
          onEnd: _onEnd,
        ),
      )
    );
  }
}