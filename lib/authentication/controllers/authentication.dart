import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final gooleSignIn = GoogleSignIn();

Future<bool> googleSignIn() async{
  GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();
  if(googleSignInAccount!=null){
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
    UserCredential result = await auth.signInWithCredential(credential);
    User user = await auth.currentUser;
    print(user.uid);
    return Future.value(true);
  }
}

Future<bool> signIn(String email, String password) async{
  try{
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    print(user.uid);
    return Future.value(true);
  }
  catch(e){
    print(e);
    switch(e){
      case 'ERROR_INVALID_EMAIL':
        print("error 1 boiii");
    }
  }
}

Future<bool> signUp(String email, String password) async{
  try{
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: password);
    // User user = result.user;
    return Future.value(true);
  }
  catch(e){
    switch(e){
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        print("error 1 boiii");
    }
  }
}

Future<bool> signOutUser() async{
  User user = await auth.currentUser;
  if (user.providerData[1] == 'google.com'){
    await gooleSignIn.signOut();
  }
  await auth.signOut();
  return Future.value(true);
}