import 'package:book_my_cricket_box/Ui/otp.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:book_my_cricket_box/Wigets/Roundbutton.dart';
import 'package:book_my_cricket_box/common/back_ground.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class number extends StatefulWidget {
  const number({Key? key}) : super(key: key);

  @override
  State<number> createState() => _numberState();
}

class _numberState extends State<number> {
  bool loading = false;
  final phone = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: BackGround(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            Center(
                child: Image.asset(
              "assets/logo.png",
              height: MediaQuery.of(context).size.height * 0.12,
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: TextFormField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '+91 3825654259',
                  border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40,left: 40),
              child: RoundButton(
                  title: "Loging",
                  loading: loading,
                  onTap: () async{
                    setState(() {
                      loading=true;
                    });

               await     auth.verifyPhoneNumber(
                        phoneNumber: phone.text,
                        verificationCompleted: (_) {
                          setState(() async{
                            loading = false;
                          });
                        },
                        verificationFailed: (e) {
                          setState(() {
                            loading = false;
                            print(loading);
                            print("aass ${e.message}");
;                          });
                          Utils().toastmasg(e.toString());

                        },
                        codeSent: (String verification, int? token) {
                          setState(() {
                            loading=false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return verify(
                                  verifyid: verification,
                                );
                              },
                            ),

                          );

                        },
                        codeAutoRetrievalTimeout: (e) {
                          setState(() {
                            loading=false;
                          });

                          Utils().toastmasg(e.toString());
                          print(e);

                        });
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
