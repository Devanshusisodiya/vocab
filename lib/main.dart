import 'package:flutter/material.dart';
import 'package:vocab/utils/wrapper.dart';

import 'package:vocab/views/home.dart';
import 'package:vocab/views/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Wrapper(),
    );
  }
}
