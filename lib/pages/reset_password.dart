import 'package:flutter/material.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPass extends StatefulWidget {
  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  String email;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
              //color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "LOGO",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50, bottom: 10, left: 30, right: 30),
                      child: TextFormField(
                        onChanged: (context){
                          setState(() {
                            email = context;
                          });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "E-Mail",
                            prefixIcon: Icon(Icons.mail),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 50, left: 30,right: 30
                      ),
                      child: FlatButton(
                        minWidth: 160,
                        onPressed: (){
                          auth.sendPasswordResetEmail(email: email).then((value) => Fluttertoast.showToast(msg:"Email Sent, Please Verify")).catchError((error) => Fluttertoast.showToast(msg: "Unable to Send Email"));
                        },
                        child: Text("Reset Password",style: TextStyle(color: Colors.white),),
                        color: Colors.blueAccent,
                      ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 30,right: 30
                      ),
                      child: FlatButton(
                        minWidth: 160,
                        onPressed: () => Navigator.pop(context),
                        child: Text("Sign In",style: TextStyle(color: Colors.white),),
                        color: Colors.greenAccent,
                      ),
                    ),
                  ]),
                )),
          ),
        )
      ],
    );
  }
}
