import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    Response response = await get(Uri.parse('http://192.168.1.106:3000/map?group=${prefs.getString('group')}'));
    Map data = jsonDecode(response.body);
    print(data.keys);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
          backgroundColor: Colors.blue[500],
          foregroundColor: Colors.white,
          title: const Text('Where is this guy?'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget> [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  child: const Icon (
                    Icons.settings,
                  )
              ),
            )
          ]
      ),
      body: const Center(child: Text('This is the body, where the map will reside')),
    );
  }
}
