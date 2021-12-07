import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'common.dart';
import 'home_page.dart';

class sign_in extends StatefulWidget{
  _state createState() => _state();
}

class _state extends State<sign_in>{
  Future signIn(String email, String password) async{
    try {
      await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> home_page()));
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
  Future phonenumbersignIn(PhoneAuthCredential phoneAuthCredential) async{
    final authcredit = await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    try {
      if(authcredit.user!=null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> home_page()));
      }
    } on FirebaseAuthException catch (e) {
      // TODO
      Common().customtoast(e.message.toString());
    }
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/OIP.jpg"),
          // Padding(
          //   padding: EdgeInsets.all(5),
          //   child: TextField(
          //     controller: emailController,
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
          //       labelText: 'Email Address',
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.all(5),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
                labelText: 'Phone Number',
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.all(5),
          //   child: TextField(
          //     obscureText: true,
          //     controller: passwordController,
          //     decoration: InputDecoration(
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.elliptical(5,5))),
          //       labelText: 'Password',
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.all(5),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       signIn(emailController.text, passwordController.text);
          //     },
          //     child: Text('Log In'),
          //   ),
          // )
          Padding(
            padding: EdgeInsets.all(5),
            child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: "+88"+phoneController.text,
                    verificationCompleted: (verificationCompleted){
                      phonenumbersignIn(verificationCompleted);
                }
                    , verificationFailed: (verificationFailed){
                  Common().customtoast("The Phone verification is incomplete");
                },
                    codeSent: (codeSent, PhoneCodeSent){},
                    codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout){},
                );
              },
              child: Text('Verify'),
            ),
          )
        ],
      ),
    );
  }
}
