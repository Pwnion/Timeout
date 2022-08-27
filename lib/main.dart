import 'package:flutter/material.dart';
import 'package:timeout/times.dart';


void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Timeout',
        home: Scaffold(
          body: Times(),
        )
    );
  }
}