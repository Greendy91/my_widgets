import 'package:flutter/material.dart';
import 'package:my_widgets/repository/settings.dart';
import 'package:my_widgets/widget/menu.dart';

class HomePage extends StatelessWidget {


  static final String routeName = "home";
  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {

    prefs.ultimaPagina = HomePage.routeName ;



    return Scaffold(
      appBar: AppBar(
        title: Text("User preferences"),
        backgroundColor: (prefs.colorSecundario ) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),

          Text("Género: ${prefs.genero}"),
          Divider(),

          Text("Nombre: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }






}
