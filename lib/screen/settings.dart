import 'package:flutter/material.dart';
import 'package:my_widgets/repository/settings.dart';

import 'package:my_widgets/widget/menu.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = "settings";

  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _colorSecundario;
  int? _genero;

  late TextEditingController _textController;
  final prefs = UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _textController = TextEditingController(text: prefs.nombre);
  }

  _setSelectedRadio(int? valor) {
    _genero = valor;
    prefs.genero = valor ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
        ),
        drawer: const MenuWidget(),
        body: ListView(padding: const EdgeInsets.all(25.0), children: [
          const Text(
            "Settings",
            style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          SwitchListTile(
            value: _colorSecundario!,
            title: const Text("Color secundario"),
            onChanged: (value) {
              _colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: const Text("Masculino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: const Text("Femenino"),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          const Divider(),
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
                labelText: "Nombre",
                helperText: "Nombre de la persona usando el teléfono"),
            onChanged: (value) {
              prefs.nombre = value;
            },
          )
        ]));
  }
}
