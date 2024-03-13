import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = "Kevin";
  String group = "Group1";


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
      body: Center(child: Text('This is the body, where the map will reside\nlogged in as $name, in group $group')),
    );
  }
}
