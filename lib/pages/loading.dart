import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    Response response = await get(Uri.parse('http://192.168.1.106:3000/map?group=${prefs.getString('group')}'));
    Map data = jsonDecode(response.body);
    print(data.keys);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Loading screen"),
    );
  }
}