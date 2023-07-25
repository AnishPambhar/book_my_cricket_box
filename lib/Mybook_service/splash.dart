import 'dart:async';



import 'package:book_my_cricket_box/Ui/BoxCricket.dart';
import 'package:book_my_cricket_box/Ui/bottam.dart';
import 'package:book_my_cricket_box/Ui/selectCity.dart';
import 'package:book_my_cricket_box/Ui/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/material.dart';

class Splashscrren {
  void isloging(BuildContext context) {


    Firebase.initializeApp();
    final auth = FirebaseAuth.instance;
    final uesr = auth.currentUser;
    if (uesr != null) {
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
            return botam();
          }), (route) => false));
    } else {
      Timer(
          Duration(seconds: 3),
              () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
            return Login();
          }), (route) => false));
    }
  }
}
