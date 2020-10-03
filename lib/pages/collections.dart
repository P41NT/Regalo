import 'package:dress_me_up/authentication/controllers/authentication.dart';
import 'package:dress_me_up/authentication/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dress_me_up/pages/ItemPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dress_me_up/components/item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:async/async.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  List Saved;
  String name;
  List<Map> itemInfoList = [];

  Future refreshList() async{
    //await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  Future _future;
  AsyncMemoizer _memoizer;

  @override
  void initState(){
    //_future = getSavedItems();
    super.initState();
    _memoizer = AsyncMemoizer();
  }

  bool checkListMaps(List<Map> list, Map map){
    if(list.isNotEmpty){
    for(int i = 0; i <= list.length; i++){
      if(list[i].values.last == map.values.last) return false;
      else return true;
    }
    }
    else return true;
  }
  bool isTrue(){
    return true;
  }

  Future getSavedItems() async{
    //return this._memoizer.runOnce(() async{
      itemInfoList = [];
      DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid);
      DocumentSnapshot doc = await docRef.get();
      Saved = doc.data()["Saved"];
      //print(Saved);
      //print(itemInfoList);
      for(int i = 0; i <= Saved.length ; i++){
        DocumentSnapshot itemDoc = await FirebaseFirestore.instance.collection("items").doc(Saved[i]).get();
        Map<String, dynamic> itemInfo = itemDoc.data();
        itemInfo['id'] = Saved[i];
        //print(itemInfo);
        List<Map> dummylist = [{1:1},{1:2}];
        print("Adding");
        print(itemInfoList);
        bool IsIn = checkListMaps(itemInfoList, itemInfo);
        //print(IsIn);
        if(IsIn) {
          itemInfoList.add(itemInfo);
          //print("added");
        }

        print('test');
        //print('test' + checkListMaps(dummylist, {1:1}).toString());
        //print('test' + isTrue().toString());
        // print("checking");
        //print(itemInfoList.toString() + "This is the list!!");
      }
      return true;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _future = getSavedItems();
    });
    return FutureBuilder(
        future : _future,
        builder: (context, dummy){
          print(itemInfoList.length);
          //getSavedItems();
          return Column(
            children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Saved Items",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  ),
              //FlatButton(onPressed: () => refreshList(), child: Text("Refresh")),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: itemInfoList.length,
                  itemBuilder: (context, index){
                    //itemInfoList.toSet().toList();
                    //print(itemInfoList[1]);
                    //setState(() {});
                    return CollectionItem(parent: this, itemInfo: itemInfoList[index]);
                  }
              ),
            ],
          );
        }
    );
  }
}


class CollectionItem extends StatefulWidget {

  CollectionItem({
    @required this.itemInfo,
    @required this.parent
});
  _CollectionsState parent;
  final Map itemInfo;

  @override
  _CollectionItemState createState() => _CollectionItemState(parent: parent);
}

class _CollectionItemState extends State<CollectionItem> {

  _CollectionsState parent;

  _CollectionItemState({
   @required this.parent
});
  List saved;

  // void getSavedItems(){
  //   _CollectionsState().getSavedItems();
  // }
  //
  // void setStateCol(){
  //   _CollectionsState().setState(() {
  //     getSavedItems();
  //   });
  // }
  Future removeFromCollection() async{
    String id = widget.itemInfo['id'];
    DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid);
    DocumentSnapshot doc = await docRef.get();
    saved = doc.data()["Saved"];
    print(saved);
    if(saved.contains(id)){
      await FirebaseFirestore.instance.collection("users").doc(auth.currentUser.uid).update(
          {
            "Saved" : FieldValue.arrayRemove([id])
          }
      );
      Fluttertoast.showToast(msg: "Successfully removed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: [
            Item(pic1: widget.itemInfo['pic_one'], pic2: widget.itemInfo['pic_two'], pic3: widget.itemInfo['pic_three'],url1: widget.itemInfo['url1'], url2: widget.itemInfo['url2'], url3: widget.itemInfo['url3'], id: widget.itemInfo['id'],),
            Center(
              child: Column(
                children: [
                  Center(child: IconButton(icon: Icon(Icons.delete, color: Colors.red,), onPressed: () async{
                    await removeFromCollection();
                    this.parent.setState(() {});
                  },)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

