import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top : 30
        ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello'),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Test'))
              ]
          ),
      ),

      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hello'),
              ElevatedButton(
                  onPressed: () {},
                  child: Text('Test'))
            ]
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 30
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hello'),
              ElevatedButton(
                  onPressed: () {},
                  child: Text('Test'))
            ]
        ),
      ),

        ]
    );
  }
}