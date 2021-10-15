import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NonSub extends StatefulWidget {
  const NonSub({Key? key}) : super(key: key);

  @override
  _NonSubState createState() => _NonSubState();
}

class _NonSubState extends State<NonSub> {
  void getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
