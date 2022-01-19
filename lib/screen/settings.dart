import 'package:flutter/material.dart';
import 'package:my_widgets/repository/settings.dart';

import 'package:my_widgets/widget/menu.dart';



class SettingsPage extends StatefulWidget {
  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}



class _SettingsPageState extends State<SettingsPage> {

  bool? _colorSecundario ;
  int? _genero ;
  String _nombre = "Pedro";

  late TextEditingController _textController ;
  final prefs = UserPreferences();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName ;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = new TextEditingController( text: prefs.nombre );
  }



  _setSelectedRadio( int? valor )  {
    _genero = valor ;
    prefs.genero = valor ?? 0 ;
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: (prefs.colorSecundario ) ? Colors.teal : Colors.blue,
        ),
        drawer: MenuWidget(),


        body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text("Settings Page", style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
              ),
              Divider(),
              SwitchListTile(
                value: _colorSecundario!,
                title: Text("Color secundario"),
                onChanged: (value){
                  _colorSecundario = value ;
                  prefs.colorSecundario = value ;
                  setState(() {
                  });
                },
              ),

              RadioListTile(
                value: 1,
                title: Text("Masculino"),
                groupValue: _genero,
                onChanged: _setSelectedRadio,
              ),

              RadioListTile(
                value: 2,
                title: Text("Femenino"),
                groupValue: _genero,
                onChanged: _setSelectedRadio,
              ),
              Divider(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                      labelText: "Nombre",
                      helperText: "Nombre de la persona usando el teléfono"
                  ),
                  onChanged: (value){
                    prefs.nombre = value ;
                  },
                ),
              )

            ])
    );
  }
}
