import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:dress_me_up/components/recRow.dart';

class HomePage extends StatefulWidget {
  @override
  final String uid;
  HomePage({@required this.uid});
  _HomePageState createState() => _HomePageState(uid);
}

class _HomePageState extends State<HomePage> {
  String uid;
  _HomePageState(uid){
    this.uid = uid;
  }
  Map user_data;
  void main() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();
    Map user_data = variable.data();
    //print(user_data);
    setState(() {
      user_data = user_data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            .snapshots(),
        builder: (context, snapshot) {
          DateTime now = new DateTime.now();
          print(snapshot.toString());
          if (!snapshot.hasData)
            return Text("Loading...");
          //return Text(snapshot.data.get("Name"));
          else {
            if (snapshot.data.get("State") == 0) {
              //print("Student");
              //student
              if (now.hour < 12) {
                print("less than 12");
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 14,bottom: 20),
                      child: Text("Hello " + snapshot.data.get("Name"), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "blue"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                  ],
                );
              } else {
                print("after 4");
                //after 5 anyday....
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, top: 14),
                      child: Text("Hello " + snapshot.data.get("Name"), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    ),
                    RecRow(title: "Get Stylish For Work", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "blue"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),
                    RecRow(title: "Get Stylish For School", tag: "office"),

                  ],
                );
              }
            }
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 14),
                  child: Text("Hello " + snapshot.data.get("Name"), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                RecRow(title: "Get Stylish For Work", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "blue"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
                RecRow(title: "Get Stylish For School", tag: "office"),
              ],
            );
          }
        },
      ),
    );
  }
}
