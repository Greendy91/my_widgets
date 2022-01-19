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
          DrawerHeader(
            child: Container(child: Text("My menu")),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/design/menu-img.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
              leading: Icon(
                Icons.pages,
                color: Colors.blue,
              ),
              title: Text("Home"),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, HomePage.routeName)),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text("People"),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
              title: Text("Settings"),
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