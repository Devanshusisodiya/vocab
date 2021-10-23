import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WordScreen extends StatefulWidget {
  final word;
  final meaning;
  const WordScreen({Key? key, @required this.word, @required this.meaning})
      : super(key: key);

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  // GET CURRENT DATE AND SEND REQUEST BODY

  // void _getWordData() async {
  //   var res = await http.post(Uri.parse('http://10.0.2.2:8000/word/getWord'),
  //       headers: <String, String>{"Content-Type": "application/json"},
  //       body: jsonEncode(<String, String>{"word": widget.word}));

  // }

  @override
  void initState() {
    // _getWordData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.word.toString() + "\n" + widget.meaning.toString()),
      ),
    );
  }
}
