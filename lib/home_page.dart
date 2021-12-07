import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/drawer.dart';

class home_page extends StatefulWidget{
  _State createState() => _State();
}

class _State extends State<home_page>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: Drawer(
        child: drawer(context),
      ),
      appBar: AppBar(),
      body: Text("This is the Main Page"),
    );
  }
}
