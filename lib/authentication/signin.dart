import 'package:dress_me_up/authentication/signup.dart';
import 'package:dress_me_up/components/decoration.dart';
import 'package:dress_me_up/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:dress_me_up/authentication/signin.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';


// class SignIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email;
  String password;
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  void login() {
    if (FormKey.currentState.validate()) {
      FormKey.currentState.save();
      signin(email, password, context).then((value) {
        User user = FirebaseAuth.instance.currentUser;
        if (value != null) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home(uid: user.uid,),
              ));
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Form(
              key: FormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
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
                        top: 60, bottom: 10, left: 30, right: 30),
                    child: TextFormField(
                      onChanged: (val) => email = val,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "E-Mail", prefixIcon: Icon(Icons.email)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 40, left: 30, right: 30),
                    child: TextFormField(
                      onChanged: (val) => password = val,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password", prefixIcon: Icon(Icons.vpn_key)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: FlatButton(
                          onPressed: () => login(),
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: FlatButton(
                          onPressed:() => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SignUp())),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(onPressed: ()=>googleSignIn().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()))), child: Text("Sign In With Google"))//This doesnt work on my computer bcoz IOS Simulator so dint test, u test plsssss!!
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ),
    ],);
  }
}

