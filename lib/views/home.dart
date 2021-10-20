import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as console;
import 'package:vocab/pages/allWords.dart';
import 'package:vocab/pages/favorites.dart';
import 'package:vocab/pages/mastered.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pages = [AllWords(), Mastered(), Favorites()];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 150),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple[700],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(400, 100))),
              child: Center(
                child: Text(
                  "EP Vocab",
                  style: TextStyle(
                      shadows: <Shadow>[
                        Shadow(blurRadius: 70, offset: Offset(-5.0, 5.0)),
                        Shadow(blurRadius: 70, offset: Offset(5.0, -5.0))
                      ],
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            Container(),
            Positioned(
              top: 150.0,
              left: 40.0,
              right: 40.0,
              child: AppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white,
                primary: false,
                title: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey))),
                actions: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        icon: Icon(Icons.search,
                            color: Theme.of(context).primaryColor),
                        onPressed: () {},
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      //
      //
      //
      body: _pages.elementAt(_selectedIndex),
      //
      //
      //
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
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Mastered'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );
  }
}
