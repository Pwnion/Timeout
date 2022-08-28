import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:timeout/main.dart';
import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {


  // Future<List<AppInfo>> getApps() async{
  //   // Returns a list of only those apps that have launch intent
  //   List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
  //   //
  //   // for (AppInfo a in apps) {
  //   //   print(a.name);
  //   // }
  //
  //   return apps;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppInfo>>(
        future: InstalledApps.getInstalledApps(true, true),
        builder: (BuildContext context, AsyncSnapshot<List<AppInfo>> snapshot) {
          return snapshot.connectionState == ConnectionState.done
              ? snapshot.hasData
              ? ListView.builder(itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              AppInfo app = snapshot.data![index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.memory(app.icon!),
                  ),
                  title: Text(app.name!),
                  onTap: () =>
                      InstalledApps.startApp(app.packageName!),
                  onLongPress: () =>
                      InstalledApps.openSettings(app.packageName!),
                ),
              );
            },
          ) : Center(
              child: Text(
                  "Error occurred while getting installed apps ...."))
              : Center(child: Text("Getting installed apps ...",));
        }
    );
  }
}