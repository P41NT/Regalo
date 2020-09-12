import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String pic1;
  final String pic2;
  final String pic3;
  final String url1;
  final String url2;
  final String url3;
  final List tags;
  Item({
    this.pic1,
    this.pic2,
    this.pic3,
    this.url1,
    this.url2,
    this.url3,
    this.tags
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(pic1 + " " + pic2),
          Text(url1 + " " + url2),
          for(int i = 0; i <= tags.length-1; i++)
            Text(tags[i])
        ],
      ),
    );
  }
}
