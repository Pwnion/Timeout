import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:timeout/times.dart';

class Home extends StatefulWidget {
  final bool mainScreen;
  final String bannedApp = "AMdroid";
  const Home({Key? key, required this.mainScreen}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                color: app.name == widget.bannedApp ?
                  widget.mainScreen == true ? Colors.grey : null
                  : null,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.memory(app.icon!),
                  ),
                  title: Text(app.name!),
                  onTap: () {
                    widget.mainScreen == true ?
                      app.name != widget.bannedApp ?
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Times(
                              times: const [
                                1, 5, 10, 30
                              ],
                              packageName: app.packageName!
                          )),
                        ) : {}
                    : Navigator.pop(context, app.packageName!);
                  },
                  onLongPress: () =>
                      InstalledApps.openSettings(app.packageName!),
                ),
              );
            },
          ) : const Center(
              child: Text(
                  "Error occurred while getting installed apps ...."
              )
          ) : const Center(
              child: Text(
                "Getting installed apps ...",
              )
          );
        }
    );
  }
}