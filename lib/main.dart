import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:test_firebase/sign_in.dart';
import 'package:test_firebase/sign_up.dart';
import 'drawer.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}


class MyApp extends StatefulWidget{
  _State createState()=> _State();
}

class _State extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
    //     drawer: Drawer(
    //   child: drawer(context),
    // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/OIP.jpg"),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(left: 25),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_up()));
                    },
                    child: const Text("Sign Up"),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(right: 25),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => sign_in()));
                    },
                    child: const Text("Login"),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}