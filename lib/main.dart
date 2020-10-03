import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_me_up/authentication/signin.dart';
import 'package:dress_me_up/pages/home.dart';
import 'package:dress_me_up/pages/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dress_me_up/pages/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  void getUserData() async {
    QuerySnapshot variable = await FirebaseFirestore.instance
        .collection("users")
        //.doc("6XvQYYodcqWSAPqcQZrJ8FDXd7u1")
        .get();
    //Map user_data = variable.data();
    //print(user_data);
    //user_data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen()
      //home: SignIn()
      //Home(uid: "6XvQYYodcqWSAPqcQZrJ8FDXd7u1",),
    );
  }
}
