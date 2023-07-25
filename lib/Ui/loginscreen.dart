import 'package:book_my_cricket_box/Ui/selectCity.dart';
import 'package:book_my_cricket_box/Ui/Signup.dart';
import 'package:book_my_cricket_box/Ui/loggingWithNum.dart';
import 'package:book_my_cricket_box/Ui/verifySplashscreen.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:book_my_cricket_box/Wigets/Roundbutton.dart';
import 'package:book_my_cricket_box/common/back_ground.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'logingsplashscreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseAuthService _authService = FirebaseAuthService();
  bool loading=false;
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void loging() {
    setState(() {
      loading=true;
    });
    _auth
        .signInWithEmailAndPassword(
        email: email.text.toString(), password: password.text.toString())
        .then((value) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return logingverify();
          }), (route) => false);
      setState(() {
        loading = false;
      });
      Utils().toastmasg(value.user!.email.toString());
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().toastmasg(error.toString());
    });
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
                        padding: const EdgeInsets.only(left: 30,right: 30),
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
                        padding: const EdgeInsets.only(left: 30,right: 30),
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
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: RoundButton(title: "Logging",loading: loading, onTap: (){
                  if(_formkey.currentState!.validate()){
                    loging();

                  }
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
              InkWell(onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return number();
                }));
              },
                child: Container(
                  height: 50,
                  width: 295,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(child: Text("Loging with Phone")),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(height: 50,width: 295,
                child: SignInButton(
                  Buttons.Google,
                  shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(50)), onPressed: ()async{
                  await _authService.signInWithGoogle().then((value) {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                          return Splashverify();
                        }), (route) => false);
                  }).onError((error, stackTrace) {
                    Utils().toastmasg(error.toString());
                  });
                },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}

// Image.asset(
// "assets/backgroung.png",
// height: 800,fit: BoxFit.fill,
// ),
