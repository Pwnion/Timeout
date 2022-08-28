import 'package:flutter/material.dart';
import 'package:timeout/settings.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:timeout/times.dart';
import 'dart:io';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Future<void> _requestPermissions() async {
    final bool permGranted = await FlutterOverlayWindow.isPermissionGranted();
    if(permGranted) {
      return;
    }

    final bool? status = await FlutterOverlayWindow.requestPermission();
    if(status == null || !status) {
      exit(0);
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Timeout',
      home: Scaffold(
        body: Times(
          times: [
            1,
            5,
            10,
            30
          ]
        ),
      )
    );
  }
}