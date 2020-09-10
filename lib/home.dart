import 'package:dress_me_up/collections.dart';
import 'package:dress_me_up/homepage.dart';
import 'package:dress_me_up/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int current_index = 0;
  final List tabs = [
    HomePage(),
    Collections(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[current_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: current_index,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.collections),label: "Collections"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }

  onTappedBar(int index) {
    setState(() {
      current_index = index;
    });
  }
}
