import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:timeout/home.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class Group extends StatefulWidget {
  const Group({Key? key}) : super(key: key);

  @override
  State<Group> createState() => _GroupState();
}

class _GroupState extends State<Group> {
  Uint8List? icon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Group'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Create Group',
            onPressed: () {
                },
              ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete Group',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20.0),
              height: MediaQuery.of(context).size.width*0.45,
              width: MediaQuery.of(context).size.width*0.9,
              child: Container( margin: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.elliptical(20.0, 20.0)),
                ), child: Padding(
                    padding: const EdgeInsets.only(
                      top:50
                      ),
                      child: Wrap(
                      spacing: 30,
                      alignment: WrapAlignment.center,
                      children: [ icon == null ? const Text("") : Image.memory(icon!, width: 75, height: 75,), ]
                        ),
                  )
              ),
            )
            ,
            Positioned(
              right: 5.0,
              bottom: 0.0,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xff94d500),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ), onPressed: () async {
                      dynamic packageName = await Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context) =>  const Home(
                              mainScreen: false,)
                          )
                      );
                      AppInfo app = await InstalledApps.getAppInfo(packageName);
                      setState(() { icon = app.icon!; });
                },
                ),
              )
            )
          ],
        )
        ),
      );
  }
}