import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        Text("Profile"),
        RaisedButton(onPressed:() => signOutUser())
      ],
    ),),);
  }
}
