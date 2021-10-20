import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as console;

import 'package:vocab/views/home.dart';
import 'package:vocab/views/login.dart';
import '../views/payment.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool globalLoggedInStatus = false;

  void checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var localLoggedInStatus = prefs.getBool('status');
    if (localLoggedInStatus != null) {
      setState(() {
        globalLoggedInStatus = localLoggedInStatus;
      });
    }
  }

  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: globalLoggedInStatus ? HomePage() : Login(),
    );
  }
}
