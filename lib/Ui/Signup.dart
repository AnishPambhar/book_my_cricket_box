import 'package:book_my_cricket_box/Ui/loginscreen.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:book_my_cricket_box/Wigets/Roundbutton.dart';
import 'package:book_my_cricket_box/common/back_ground.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void signup() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _auth
          .createUserWithEmailAndPassword(
              email: email.text.toString(), password: password.text.toString())
          .then((value) {
        setState(() {
          loading = false;
        });
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Login();
        }));
      }).onError(
        (error, stackTrace) {
          Utils().toastmasg(error.toString());
          setState(
            () {
              loading = false;
            },
          );
        },
      );
    }
  }

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
            Form(
                autovalidateMode: AutovalidateMode.always,
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: "Email",
                            helperText: "enter your email e.g jion@gmail.com",
                            prefixIcon: Icon(Icons.alternate_email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your email";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: password,
                        obscureText: true,
                        autofocus: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            helperText: "enter your Password e.g aushb@3456",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Password";
                          }
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: RoundButton(
                  title: "SignUp",
                  loading: loading,
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      signup();
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Aready have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text(
                      "Logging",
                      style: TextStyle(color: Colors.red),
                    ))
              ],
            ),
          ],
        ),
      )
    ));
  }
}
// Image.asset(
// "assets/backgroung.png",
// height: 800,fit: BoxFit.fill,
// ),
