import 'package:dress_me_up/decoration.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:dress_me_up/signin.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInForm(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.8,
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
                  top: 80, bottom: 20, left: 30, right: 30),
              // child: TextFormField(
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //       labelText: "E-Mail", prefixIcon: Icon(Icons.email)),
              // ),
              child: EmailTextFormField(
                decoration: signInInputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 30, right: 30),
              // child: TextFormField(
              //   keyboardType: TextInputType.text,
              //   obscureText: true,
              //   validator: (val) =>
              //       val.length < 6 ? 'Password too short.' : null,
              //   //onSaved: (val) => _password = val,
              //   decoration: InputDecoration(
              //       labelText: "Password", prefixIcon: Icon(Icons.lock)),
              // ),
              child: PasswordTextFormField(
                decoration: signInInputDecorationPass(),
              ),
            ),
            FlatButton(
              onPressed: ()=>context.signInWithEmailAndPassword(),
              child: Text(
                "Sign In",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
            ),
            FlatButton(onPressed: (){}, child: Text("Forgot Password?")),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Google",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Facebook",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
