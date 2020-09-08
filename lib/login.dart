import 'package:dress_me_up/signin.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'home.dart';
import 'decoration.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final GoogleSignIn googleSignIn = new GoogleSignIn();
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // SharedPreferences preferences;
  // bool loading = false;
  // bool isLoggedIn = false;
  //
  // @override
  // void initState(){
  //   super.initState();
  //   Firebase.initializeApp().whenComplete(() => print("Completed"));
  //   isSignedIn();
  //   setState(() {});
  // }
  //
  // void isSignedIn() async{
  //   setState(() {
  //     loading = true;
  //   });
  //   preferences = await SharedPreferences.getInstance();
  //   isLoggedIn = await googleSignIn.isSignedIn();
  //   if(isLoggedIn){
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: null));
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }
  //
  // Future HandleSignin() async{
  //   preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });
  //   GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
  //   AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
  //   User firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
  //   if(firebaseUser != null){
  //     final QuerySnapshot result = await FirebaseFirestore.instance.collection("users").where("id", isEqualTo: firebaseUser.uid).get();
  //     final List<DocumentSnapshot> documents = result.docs;
  //     if(documents.length == 0){
  //       FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({"id" : firebaseUser.uid,"username":firebaseUser.displayName,"profilePicture":firebaseUser.photoURL});
  //       await preferences.setString("id", firebaseUser.uid);
  //       await preferences.setString("username", firebaseUser.displayName);
  //       await preferences.setString("photoUrl", firebaseUser.displayName);
  //     }
  //     else{
  //       await preferences.setString("id", documents[0].data()['id']);
  //       await preferences.setString("username", documents[0].data()['username']);
  //       await preferences.setString("photoUrl", documents[0].data()['photoUrl']);
  //     }
  //     Fluttertoast.showToast(msg: "Login Success!");
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  //   else{
  //
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children :[
        Scaffold(
          backgroundColor: Colors.blueAccent,
          //appBar: AppBar(backgroundColor: Colors.blue,),
          body: LitAuth.custom(
            child: Center(
              child: SignIn()
              ),
          ),
          ),
      ]);
  }
}

