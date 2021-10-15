import 'package:flutter/material.dart';
import 'dart:developer' as console;

class WordList extends StatelessWidget {
  final list;
  const WordList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              console.log('word tapped');
            },
            child: Card(
                color: Colors.purple[50],
                elevation: 5,
                child: ListTile(
                  title: Text(list[index].toString()),
                )));
      },
    );
  }
}
