import 'package:dress_me_up/components/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecRow extends StatelessWidget {
  final String title;
  final String tag;

  RecRow({
    this.title,
    this.tag
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("items").where("tags",arrayContains: tag).orderBy("rating",descending: true).limit(10).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) return Text("Loading");
          else{
            return Column(
                 children:[
                   Text("data"),
                   ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index){
                    DocumentSnapshot data = snapshot.data.documents[index];
                    Map ds = data.data();
                    print(ds['rating']);
                    //return Text("hole");
                    return Item(pic1:ds['pic_one'],pic2:ds['pic_two'],url1:ds['url1'],url2:ds["url2"],tags:ds["tags"],pic3: ds['pic_three'],url3: ds['url3'],);
                  }
            )
            ]);
          }
        },
      ),
    );
  }
}
