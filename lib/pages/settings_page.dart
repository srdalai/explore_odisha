import 'package:expolre_odisha/widgets/widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool darkMode, _value2, _value3, _value4, _value5;

  @override
  void initState() {
    super.initState();
    defaultPrefs();
  }

  void defaultPrefs() {
    darkMode = _value2 =_value3 = _value4 = _value5 = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: NewAppBar(context, titleTxt: 'Settings',),
      body: Column(
        children: <Widget>[
          new SwitchListTile(
            title: new Text("Dark Mode"),
            value: darkMode,
            onChanged: (bool value) { setState(() { darkMode = value; }); /*setPreferenceData();*/ },
            secondary: const Icon(Icons.wb_sunny),
          ),
          new SwitchListTile(
            title: new Text("Recieve Notifications"),
            value: _value2,
            onChanged: (bool value) { setState(() { _value2 = value; });},
            secondary: const Icon(Icons.notifications),
          ),
          new SwitchListTile(
            title: new Text("Check for update at startup"),
            value: _value3,
            onChanged: (bool value) { setState(() { _value3 = value; });},
            secondary: const Icon(Icons.system_update),
          ),
          new SwitchListTile(
            title: new Text("Subscribe to newsletter"),
            value: _value4,
            onChanged: (bool value) { setState(() { _value4 = value; });},
            secondary: const Icon(Icons.mail),
          ),
          new SwitchListTile(
            title: new Text("Send Dignostics data"),
            value: _value5,
            onChanged: (bool value) { setState(() { _value5 = value; });},
            secondary: const Icon(Icons.compare_arrows),
          )
        ],
      ),
    );
  }
}