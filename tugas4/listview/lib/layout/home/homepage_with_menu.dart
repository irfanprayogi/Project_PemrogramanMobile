import 'package:flutter/material.dart';
//import 'package:listview/layout/home/my_homepage.dart';
import 'package:listview/layout/home/list_with_cards.dart';
import 'package:listview/layout/home/grid_view_learning.dart';
import 'package:listview/layout/home/news_page.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    //MyHomePage(),
    Newspage(),
    GridViewLearning(),
    ListsWithCards(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' BELAJAR AJA ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_3x3),
            label: 'GridView',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'ListView',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.newspaper),
          //   label: 'News',
          // ),
        ],
      ),
    );
  }
}
