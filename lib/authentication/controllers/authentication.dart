import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final gooleSignIn = GoogleSignIn();

Future<bool> googleSignIn() async {
  GoogleSignInAccount googleSignInAccount = await gooleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);

    User user = await auth.currentUser;
    print(user.uid);

    return Future.value(true);
  }
}

// instead of returning true or false
// returning user to directly access UserID
Future<User> signin(
String email, String password, BuildContext context) async {
  try {
    if(email == password){
      print("Wrong Password");
      return null;
    }
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    print(result);
    User user = result.user;
    // return Future.value(true);
    if (user.emailVerified) return Future.value(user);
    else print("User Not Verified");
    return null;
  } catch (e){
    print(e.code);
    Alert(context: context, title: "Error", desc: e).show();
    switch (e.code) {
      case 'ERROR_INVALID_EMAIL':
        print(e.code);
        break;
      case 'ERROR_WRONG_PASSWORD':
        print(e.code);
        Alert(context: context, title: "Error", desc: "Wrong Password").show();
        break;
      case 'ERROR_USER_NOT_FOUND':
        print(e.code);
        Alert(context: context, title: "Error", desc: "User Not Found").show();
        break;
      case 'ERROR_USER_DISABLED':
        print(e.code);
        Alert(context: context, title: "Error", desc: "Account is Disabled").show();
        break;
      case 'ERROR_TOO_MANY_REQUESTS':
        print(e.code);
        Alert(context: context, title: "Error", desc: "Too Many Requests..Try Again Later").show();
        break;
      case 'ERROR_OPERATION_NOT_ALLOWED':
        print(e.code);
        Alert(context: context, title: "Error", desc: "Operation Not Allowed! No funny business here!").show();
        break;
    }
    // since we are not actually continuing after displaying errors
    // the false value will not be returned
    // hence we don't have to check the valur returned in from the signin function
    // whenever we call it anywhere
    return Future.value(null);
  }
}

// change to Future<FirebaseUser> for returning a user
Future<User> signUp(
    String email, String password, BuildContext context) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(email: email, password: email);
    User user = result.user;
    await user.sendEmailVerification();
    return Future.value(user);
    // return Future.value(true);
  } catch (error) {
    print(error.code);
    switch (error.code) {
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        print("Email Already Exists");
        Alert(context: context, title: "Error", desc: "E-Mail Exists").show();
        break;
      case 'ERROR_INVALID_EMAIL':
        print("Invalid Email Address");
        Alert(context: context, title: "Error", desc: "Invalid Email Address").show();
        break;
      case 'ERROR_WEAK_PASSWORD':
        print("Please Choose a stronger password");
        Alert(context: context, title: "Warning", desc: "Password Too Weak").show();
        break;
    }
    return Future.value(null);
  }
}

Future<bool> signOutUser() async {
  User user = await auth.currentUser;
  print(user.providerData[1].providerId);
  if (user.providerData[1].providerId == 'google.com') {
    await gooleSignIn.signOut();
  }
  await auth.signOut();
  print("Trying to log out user... Status : ");
  print(auth.currentUser == null);
  return Future.value(true);
}

Future<bool> isUserLoggedIn() async {
  var user = await auth.currentUser;
  return user != null;
}