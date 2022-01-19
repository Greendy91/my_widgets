import 'package:flutter/material.dart';
import 'package:my_widgets/repository/settings.dart';
import 'package:my_widgets/widget/menu.dart';

class HomePage extends StatelessWidget {


  static const String routeName = "home";
  final prefs = UserPreferences();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName ;



    return Scaffold(
      appBar: AppBar(
        title: const Text("User preferences"),
        backgroundColor: (prefs.colorSecundario ) ? Colors.teal : Colors.blue,
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color secundario: ${prefs.colorSecundario}"),
          const Divider(),

          Text("Género: ${prefs.genero}"),
          const Divider(),

          Text("Nombre: ${prefs.nombre}"),
          const Divider(),
        ],
      ),
    );
  }






}
