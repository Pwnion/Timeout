import 'package:flutter/material.dart';

class Times extends StatefulWidget {
  final List<int> times;
  final String packageName;

  const Times(
    {
      Key? key,
      required this.times,
      required this.packageName
    }
  ) : super(key: key);

  @override
  State<Times> createState() => _TimesState();
}

class _TimesState extends State<Times> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.times.map((final int time) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10
            ),
            child: ElevatedButton(
              onPressed: () {

              },
              child: SizedBox(
                width: 100,
                height: 50,
                child: Center(
                  child: Text(
                    '$time minutes'
                  ),
                )
              )
            )
          );
        }).toList(),
      )
    );
  }
}