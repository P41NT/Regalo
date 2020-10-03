import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_me_up/components/item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ItemPage extends StatefulWidget {
  var image1;
  var image2;
  var image3;
  var url1;
  var url2;
  var url3;
  var id;
  ItemPage(image1,image2,image3,url1,url2,url3,id){
    this.url1 = url1;
    this.url2 = url2;
    this.url3 = url3;
    this.image1 = image1;
    this.image2 = image2;
    this.image3 = image3;
    this.id = id;
  }
  @override
  _ItemPageState createState() => _ItemPageState(image1,image2, image3, url1, url2, url3,id);
}

class _ItemPageState extends State<ItemPage> {
  var image1;
  var image2;
  var image3;
  var url1;
  var url2;
  var url3;
  var id;
  List saved;
  _ItemPageState(image1,image2,image3,url1,url2,url3,id){
    this.url1 = url1;
    this.url2 = url2;
    this.url3 = url3;
    this.image1 = image1;
    this.image2 = image2;
    this.image3 = image3;
    this.id = id;
  }
  Future addToCollection() async{
    DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid);
    DocumentSnapshot doc = await docRef.get();
    saved = doc.data()["Saved"];
    if(saved.contains(id)){
      Fluttertoast.showToast(msg: "Already In Saved Items");
      print(saved);
    }
    else{
      Fluttertoast.showToast(msg: "Successfully Added");
    return await FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid).update(
      {
        "Saved" : FieldValue.arrayUnion([id])
      }
    );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body: Column(
        children: [
          CarouselSlider(items: [
            Image.network(image1),
            Image.network(image2),
            Image.network(image3),
          ], options: CarouselOptions(initialPage: 0)),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 14.0),
                child: Text("Links",textAlign: TextAlign.left, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 180),
                child: FlatButton(onPressed: () async {
                  await addToCollection();
                }, child: Text("Add To Saved"),color: Colors.greenAccent,),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text("Shoe Link : ",textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text(url1,textAlign: TextAlign.left, style: TextStyle(fontSize: 15,),),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text("Pant Link : ",textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text(url2,textAlign: TextAlign.left, style: TextStyle(fontSize: 15,),),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text("Shirt Link : ",textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text(url3,textAlign: TextAlign.left, style: TextStyle(fontSize: 15,),),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text("ID : ",textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0,left: 14.0),
                child: Text(id,textAlign: TextAlign.left, style: TextStyle(fontSize: 15,),),
              ),
            ],
          )
          //Text(id)
        ],
      ),
    );
  }
}

