import 'package:flutter/material.dart';
import 'package:whereisthisguy/pages/home.dart';
import 'package:whereisthisguy/pages/settings.dart';
import 'package:whereisthisguy/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home', //need to change back later
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/settings': (context) => Settings(),
    }
  ));
}

