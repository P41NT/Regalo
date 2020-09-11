import 'package:dress_me_up/pages/collections.dart';
import 'package:dress_me_up/pages/homepage.dart';
import 'package:dress_me_up/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  final String uid;
  Home({@required this.uid});
  @override
  _HomeState createState() => _HomeState(uid);
}

class _HomeState extends State<Home> {
  final String uid;
  _HomeState(this.uid);
  Map user_data;
  int current_index = 0;
  final List tabs = [
    HomePage(),
    Collections(),
    Profile()
  ];
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: [
          HomePage(uid: uid,),
          Collections(),
          Profile()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: current_index,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.collections),label: "Collections"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
  void pageChanged(int index) {
    setState(() {
      current_index = index;
    });
  }
  onTappedBar(int index) {
    setState(() {
      current_index = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.fastOutSlowIn);
    });
  }
}
