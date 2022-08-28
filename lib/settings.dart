import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton(
        onPressed: () {},
          child: _tile('Time Options', 'Edit your Time Options', Icons.theaters),
        ),
        const Divider(),
        ElevatedButton(
        onPressed: () {},
        child: _tile('Cooldown', 'Edit your Cooldown', Icons.theaters),
        ),
        const Divider(),
        ElevatedButton(
          onPressed: () {},
          child: _tile('Groups', 'Edit your Groups', Icons.theaters),

        ),
        const Divider(),
        ElevatedButton(
          onPressed: () {},
          child: _tile('Time Options', 'Edit your Time Options', Icons.theaters),

        )
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: Colors.white
          )),
      subtitle: Text(subtitle,
            style: const TextStyle(
                color: Colors.white
            )
      ),
      leading: Icon(
        icon,
        color: Colors.white10,
      ),
    );
  }
}