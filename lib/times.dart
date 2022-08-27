import 'package:flutter/material.dart';

class Times extends StatefulWidget {
  const Times({Key? key}) : super(key: key);

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Times Page'
      ),
    );
  }
}