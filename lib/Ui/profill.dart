import 'package:book_my_cricket_box/Ui/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Utils/utils.dart';
class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  final auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text("WELCOME"),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      actions: [
        IconButton(
          onPressed: () async {
            await _googleSignIn.signOut();
            auth.signOut().then((value) {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                    return Login();
                  }), (route) => false);
            }).onError((error, stackTrace) {
              Utils().toastmasg(error.toString());
            });
          },
          icon: Icon(
            Icons.logout_outlined,
            color: Colors.white,
          ),
        ),
      ],
    ),
      body: Column(),);
  }
}
