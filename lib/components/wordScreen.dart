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

  // Future<void> _getWordData() async {
  //   var res = await http.get(Uri.parse(''));
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
