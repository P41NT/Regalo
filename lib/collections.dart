import 'package:flutter/material.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,title: Text("Dress Me Up",)),
      body: Center(child: Text("Collections"),),
    );
  }
}
