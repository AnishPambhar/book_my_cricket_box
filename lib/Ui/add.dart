import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:book_my_cricket_box/Wigets/Roundbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Fire_Add extends StatefulWidget {
  const Fire_Add({Key? key}) : super(key: key);

  @override
  State<Fire_Add> createState() => _Fire_AddState();
}

class _Fire_AddState extends State<Fire_Add> {
  bool laoding = false;
  final fire_ref = FirebaseFirestore.instance.collection("Time");
  final Post = TextEditingController();  final add = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Add Post Firestoer",
          ),
          backgroundColor: Colors.deepPurple),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              controller: Post,
              decoration: InputDecoration(
                  hintText: "what is in your mind?",
                  border: OutlineInputBorder()),
              maxLines: 4,
            ),
          ),Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextField(
              controller: add,
              decoration: InputDecoration(
                  hintText: "what is in your mind?",
                  border: OutlineInputBorder()),
              maxLines: 4,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: RoundButton(
                title: "ADD",
                loading: laoding,
                onTap: () {
                  setState(() {
                    laoding = true;
                  });
                  String id = DateTime.now().microsecondsSinceEpoch.toString();
                  fire_ref.doc(id).set({
                    'titel': Post.text.toString(),
                    'id': id,
                    'price':add.text.toString(),

                  }).then((value) {
                    setState(() {
                      laoding = false;
                      Post.clear();
                      add.clear();
                    });
                    Utils().toastmasg("Post is add");
                  }).onError((error, stackTrace) {
                    Utils().toastmasg(error.toString());
                  });
                }),
          )
        ],
      ),
    );
  }
}
