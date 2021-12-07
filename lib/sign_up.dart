import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common.dart';
import 'home_page.dart';

class sign_up extends StatefulWidget{
  _state_ createState() => _state_();
}

class _state_ extends State<sign_up>{
  Future createUser(String email, String password) async{
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> home_page()));
      Common().customtoast("Account Created Successfully");
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
  TextEditingController contactController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/OIP.jpg"),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
                labelText: 'Email Address',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: contactController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
                labelText: 'Phone Number',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: dobController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
                labelText: 'Date Of Birth',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                createUser(emailController.text, passwordController.text);
              },
              child: Text('Sign Up'),
            ),
          )
        ],
      ),
    );
  }
}
