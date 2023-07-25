import 'dart:async';



import 'package:book_my_cricket_box/Ui/BoxCricket.dart';
import 'package:book_my_cricket_box/Ui/loginscreen.dart';
import 'package:book_my_cricket_box/Ui/selectCity.dart';


import 'package:flutter/material.dart';

class verifysuccessful {
  void isloging(BuildContext context) {
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          return City();
        }), (route) => false));

  }
}
class booked {
  void isbook(BuildContext context) {
    Timer(
        Duration(seconds: 6),
            () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
          return Box_Cricket();
        }), (route) => false));

  }
}
