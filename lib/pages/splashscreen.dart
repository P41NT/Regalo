import 'dart:async';
import 'package:dress_me_up/authentication/signin.dart';
import 'package:dress_me_up/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dress_me_up/pages/homepage.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateUser();
  }

  navigateUser() {
    // checking whether user already loggedIn or not
      if (auth.currentUser == null) {
        Timer(Duration(seconds: 2),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn())));
      } else {
        Timer(
          Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(uid: auth.currentUser.uid)))
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text("LOGO",style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
