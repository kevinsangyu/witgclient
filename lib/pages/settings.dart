import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final group = prefs.getString('group');
    final pwd = prefs.getString('pwd');
    final tracking = prefs.getBool('tracking');
    setState(() {
      this.name = name ?? "";
      this.group = group ?? "";
      this.pwd = pwd ?? "";
      this.tracking = tracking ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getSettings();
  }

  void _setSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('group', group);
    await prefs.setString('pwd', pwd);
    await prefs.setBool('tracking', tracking);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        foregroundColor: Colors.white,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController()..text = name,
                  onChanged: (text) => {},
                  decoration: const InputDecoration(
                      hintText: "This will be your display name",
                      labelText: "Enter your name"
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  onFieldSubmitted: (String? value) {
                    name = value!;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: TextEditingController()..text = group,
                  onChanged: (text) => {},
                  decoration: const InputDecoration(
                      hintText: "This group's members will be tracked for you",
                      labelText: "Enter your group"
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your group";
                    }
                    return null;
                  },
                  onFieldSubmitted: (String? value) {
                    group = value!;
                  },
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: TextEditingController()..text = pwd,
                  onChanged: (text) => {},
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Enter your password"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  onFieldSubmitted: (String? value) {
                    pwd = value!;
                  },
                ),
              ),
              TextButton(onPressed: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {_setSettings();_getSettings();});
                }
              },
                  child: const Text("Save")),
              Text("Name: $name, Group: $group, pwd: $pwd")
            ],
          )
        ),
      )
    );
  }
}
