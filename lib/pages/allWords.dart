import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as console;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:vocab/components/wordScreen.dart';
import 'package:vocab/constants/api.dart';

class AllWords extends StatefulWidget {
  const AllWords({Key? key}) : super(key: key);

  @override
  State<AllWords> createState() => _AllWordsState();
}

class _AllWordsState extends State<AllWords> {
  bool loaded = false;
  bool toShow = false;
  static List<dynamic> words = [];

  void _checkUserSubScription() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _username = prefs.getString('username').toString();
    var res = await http.post(Uri.parse('http://10.0.2.2:8000/user/getUser'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{'username': _username}));
    if (res.statusCode == 200) {
      var decode = jsonDecode(res.body);
      setState(() {
        toShow = decode["subscribed"];
      });
    }
  }

  void _getData() async {
    var res =
        await http.get(Uri.parse('http://10.0.2.2:8000/word/getAllWords'));
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
    _checkUserSubScription();
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
