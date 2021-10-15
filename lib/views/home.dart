import 'package:flutter/material.dart';
import 'package:vocab/components/bottomNavBar.dart';
import 'dart:developer' as console;

import 'package:vocab/components/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nums = ["hark", "butterphant", "hummingboon", "gorilda", "bark"];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, 250),
            child: AppBar(
              backgroundColor: Colors.purple[700],
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
              title: Text(
                "EP Vocab",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),
            )),
        body: ListView.builder(
          itemCount: nums.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  console.log('word tapped');
                },
                child: Card(
                    color: Colors.purple[50],
                    elevation: 5,
                    child: ListTile(
                      title: Text(nums[index].toString()),
                    )));
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.purple[100],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          elevation: 10,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.sort_by_alpha), label: 'Words'),
            BottomNavigationBarItem(
                icon: Icon(Icons.format_align_justify), label: 'Tests'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Mastered'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite')
          ],
        ));
  }
}
