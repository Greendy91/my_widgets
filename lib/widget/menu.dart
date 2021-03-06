import 'package:flutter/material.dart';
import 'package:my_widgets/screen/home.dart';
import 'package:my_widgets/screen/settings.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text("My menu"),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/images/fondo.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: const Text("Home"),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName)),
          ListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: const Text("People"),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: const Text("Settings"),
              onTap: () {
                //Navigator.pop(context);
                //Navigator.pushNamed(context, SettingsPage.routeName);
                Navigator.pushReplacementNamed(context, SettingsPage.routeName);
              }),
        ],
      ),
    );
  }
}
