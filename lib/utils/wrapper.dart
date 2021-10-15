import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as console;

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  void checkAndGetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt('freeCounter');
  }

  @override
  void initState() {
    super.initState();
    console.log('init');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Wrapper')),
    );
  }
}
