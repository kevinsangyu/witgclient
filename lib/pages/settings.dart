import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  String name = '';
  String group = '';
  String pwd = '';
  bool tracking = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        foregroundColor: Colors.white,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: TextButton(
        onPressed: () {
          setState(() {
            print("Saved");
          });
        },
        child: const Text("Save")
      )
    );
  }
}
