import 'package:flutter/material.dart';
import 'package:my_widgets/repository/settings.dart';
import 'package:my_widgets/screen/home.dart';
import 'package:my_widgets/screen/settings.dart';
import 'package:my_widgets/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        SettingsPage.routeName: (BuildContext context) => const SettingsPage(),
      },
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Column(
        children: <Widget>[
          Text(S.of(context).simpleText),
          Text(S.of(context).textWithPlaceholder("Yamile")),
          Text(S.of(context).textWithPlaceholders("Yamile", "Cabrera")),
          Text(S.of(context).textWithPlurals(2)),

        ],
      ),
    );
  }
}
