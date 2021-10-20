import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vocab/components/list.dart';
import 'dart:developer' as console;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vocab/components/wordScreen.dart';
import 'package:vocab/constants/api.dart';
// import '../constants/A';

class AllWords extends StatefulWidget {
  const AllWords({Key? key}) : super(key: key);

  @override
  State<AllWords> createState() => _AllWordsState();
}

class _AllWordsState extends State<AllWords> {
  bool loaded = false;
  bool toShow = true;
  int toShowCounter = -1;
  static List<dynamic> words = [];

  void _getData() async {
    var res = await http
        .get(Uri.parse('http://192.168.43.226:8000/word/getAllWords'));
    var decode = jsonDecode(res.body);
    if (res.statusCode == 200) {
      setState(() {
        console.log(decode['words'].toString());
        words = decode['words'];
        loaded = true;
      });
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? ListView.builder(
            itemCount: words.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    console.log('${words[index]} tapped');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return toShow
                          ? WordScreen(
                              word: words[index]['word'],
                              meaning: words[index]['meaning'])
                          : WordScreen(
                              word: 'Non Displayable',
                              meaning: '',
                            );
                    }));
                  },
                  child: Card(
                      color: Colors.purple[50],
                      elevation: 5,
                      child: ListTile(
                        title: Text(words[index]['word'].toString()),
                      )));
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
