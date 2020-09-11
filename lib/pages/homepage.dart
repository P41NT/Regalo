import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';

class HomePage extends StatefulWidget {
  @override
  final String uid;
  HomePage({@required this.uid});
  _HomePageState createState() => _HomePageState(uid);

}

class _HomePageState extends State<HomePage> {
  String uid = "6XvQYYodcqWSAPqcQZrJ8FDXd7u1";
  _HomePageState(this.uid);
  Map user_data;
  void main() async{
    DocumentSnapshot variable = await FirebaseFirestore.instance.collection("users").doc("6XvQYYodcqWSAPqcQZrJ8FDXd7u1").get();
    Map user_data = variable.data();
    //print(user_data);
    setState(() {
      user_data = user_data;
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(FirebaseFirestore.instance.collection("users").doc(uid).get());
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData)
            return Text("Loading");
          else{
            return Column(
              children: [
                Row(
                  children: [
                    Text("Hello "+snapshot.data.documents[0].get("Name")),
                  ],
                )
              //Text("hole")
            ],
          );
          }
        },
      ),
    );
  }
}
