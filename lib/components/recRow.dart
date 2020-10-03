import 'package:dress_me_up/components/item.dart';
import 'package:dress_me_up/pages/ItemPage.dart';
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
        stream: FirebaseFirestore.instance.collection("items").where("tags",arrayContains: tag).limit(20).snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting) return Text("");
          else if (!snapshot.hasData) return Text("No data :(");
          else{
            //print(snapshot.data.documents[0].get("rating"));
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                  ],
                ),
                  Container(
                      height: 200,
                      child: ListView.builder(
                        itemCount:snapshot.data.documents.length,
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          //itemCount: 2,//supposed to be 20 but for testing its 1 lol :)
                          itemBuilder: (context, index){
                          String image1 = snapshot.data.documents[index].get("pic_one");
                          String image2 = snapshot.data.documents[index].get("pic_two");
                          String image3 = snapshot.data.documents[index].get("pic_three");
                          String url1 = snapshot.data.documents[index].get("url1");
                          String url2 = snapshot.data.documents[index].get("url2");
                          String url3 = snapshot.data.documents[index].get("url3");
                          String id = snapshot.data.documents[index].documentID;
                          return Container(
                              width: 310,
                              child: InkWell(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(image1, image2, image3, url1, url2, url3,id))),
                                child: Card(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Image.network(image1,width: 100,),
                                        Image.network(image2,width: 100,),
                                        Image.network(image3,width: 100,),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ),
              ],
            );
          }
        },
      ),
    );
  }
}
