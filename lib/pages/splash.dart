import 'dart:async';

import 'package:dress_me_up/authentication/signin.dart';
import 'package:dress_me_up/pages/home.dart';
import 'package:dress_me_up/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  navigateUser() async{
    //await signOutUser();
    if(await FirebaseAuth.instance.currentUser != null){
      print(FirebaseAuth.instance.currentUser);
      Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())));
    }
    else{
      //print(FirebaseAuth.instance.currentUser.uid);
      // Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn())));
      Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())));
    }
  }
  @override
  Widget build(BuildContext context) {
    navigateUser();
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
