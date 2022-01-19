import 'package:flutter/material.dart';
import 'package:my_widgets/repository/settings.dart';
import 'package:my_widgets/screen/home.dart';
import 'package:my_widgets/screen/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final prefs = UserPreferences();

  MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Preferences',
        initialRoute: prefs.ultimaPagina,
        routes:{
          HomePage.routeName : (BuildContext context) => HomePage(),
          SettingsPage.routeName : (BuildContext context) => SettingsPage(),

        }
    );
  }
}
