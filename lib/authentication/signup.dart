import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:dress_me_up/authentication/signup.dart';
import 'package:dress_me_up/components/decoration.dart';
import 'package:dress_me_up/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dress_me_up/authentication/signin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String password;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void handleSignup() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      signUp(email.trim(), password, context).then((value) {
        if (value != null) {
          Navigator.pop(context);
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
              key: formKey,
              child: Column(
                children: [
                  Column(
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
                            top: 30, bottom: 10, left: 30, right: 30),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Name", prefixIcon: Icon(Icons.verified_user)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 10, left: 30, right: 30),
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
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10.0),
                        child: FlatButton(
                          onPressed: () => Navigator.pop(context),
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
                          onPressed:() => handleSignup(),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
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

//
// class SignUp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       Scaffold(
//         backgroundColor: Colors.blue,
//         body: Center(
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.6,
//               width: MediaQuery.of(context).size.width * 0.8,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       "LOGO",
//                       style: TextStyle(
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 30, bottom: 10, left: 30, right: 30),
//                     child: TextFormField(
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                           labelText: "Name", prefixIcon: Icon(Icons.verified_user)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 5, bottom: 10, left: 30, right: 30),
//                     child: TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           labelText: "E-Mail", prefixIcon: Icon(Icons.email)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         top: 5, bottom: 40, left: 30, right: 30),
//                     child: TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           labelText: "Password", prefixIcon: Icon(Icons.vpn_key)),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal:10.0),
//                         child: FlatButton(
//                           onPressed: () => Navigator.pop(context),
//                           child: Text(
//                             "Sign In",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           color: Colors.lightBlueAccent,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: FlatButton(
//                           onPressed:(){},
//                           child: Text(
//                             "Sign Up",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           color: Colors.lightGreen,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(14)),
//             ),
//           ),
//         ),
//     ],);
//   }
// }