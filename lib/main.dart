import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        foregroundColor: Colors.white,
        title: const Text('Where is this guy?'),
        centerTitle: true,
      ),
      body: const Center(child: Text('This is the body, where the map will reside')),
      floatingActionButton: const FloatingActionButton(
        onPressed: null, child: Text('Settings')
      ),
    ),
  ));
}
