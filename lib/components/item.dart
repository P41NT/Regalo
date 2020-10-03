import 'package:flutter/material.dart';
import 'package:dress_me_up/pages/ItemPage.dart';

class Item extends StatelessWidget {
  final String pic1;
  final String pic2;
  final String pic3;
  final String url1;
  final String url2;
  final String url3;
  final List tags;
  var id;
  Item({
    this.pic1,
    this.pic2,
    this.pic3,
    this.url1,
    this.url2,
    this.url3,
    this.tags,
    this.id
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ItemPage(pic1, pic2, pic3, url1, url2, url3, id))),
        child: Card(
          child: Container(
            child: Row(
              children: [
                Image.network(pic1,width: 100,),
                Image.network(pic2,width: 100,),
                Image.network(pic3,width: 100,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
