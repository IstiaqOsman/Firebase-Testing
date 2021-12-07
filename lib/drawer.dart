import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase/main.dart';
import 'common.dart';
import 'home_page.dart';

Widget drawer(BuildContext context){

  Future createUser(String email, String password) async{
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyApp()));
      Common().customtoast("Logged Out Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Common().customtoast("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Common().customtoast("The account already exists for that email.");
      }
    } catch (e) {
      print(e);
      Common().customtoast(e.toString());
    }
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          borderOnForeground: true,
          child:
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => home_page()));
            },
          ),
        ),
        Card(
          borderOnForeground: true,
          child:
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Log Out'),
            onTap: (){
              createUser(emailController.text, passwordController.text);
            },
          ),
        ),
      ],
    ),
  );
}