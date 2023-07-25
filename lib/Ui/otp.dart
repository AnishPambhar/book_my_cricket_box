import 'package:book_my_cricket_box/Ui/selectCity.dart';
import 'package:book_my_cricket_box/Ui/verifySplashscreen.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:book_my_cricket_box/Wigets/Roundbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class verify extends StatefulWidget {
  final String verifyid;
  const verify({Key? key, required this.verifyid}) : super(key: key);

  @override
  State<verify> createState() => _verifyState();
}

class _verifyState extends State<verify> {
  bool loading = false;
  final otp = TextEditingController();

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late List<bool> _isContentChanged;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(6, (_) => TextEditingController());
    _focusNodes = List.generate(6, (_) => FocusNode());
    _isContentChanged = List.generate(6, (_) => false);
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    setState(() {
      _isContentChanged[index] = value.isNotEmpty;
    });
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Center(
              child: Image.asset(
            "assets/logo.png",
            height: MediaQuery.of(context).size.height * 0.12,
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
              Color backgroundColor =
                  _isContentChanged[index] ? Colors.red : Colors.white;
              return Container(
                height: 70,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: backgroundColor),
                child: Center(
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    decoration: InputDecoration(
                      fillColor: _controllers[index].text.isNotEmpty
                          ? Colors.red
                          : Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      counterText: '',
                      filled: true,
                    ),
                    onChanged: (value) => _onTextChanged(index, value),
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: _isContentChanged[index]
                          ? Colors.white
                          : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          RoundButton(
              title: "Verify",
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verifyid,
                    smsCode: otp.text.toString());
                try {
                  await auth.signInWithCredential(credential);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Splashverify();
                      },
                    ),
                  );
                } catch (e) {
                  setState(() {
                    loading = true;
                  });
                  Utils().toastmasg(e.toString());
                }
              })
        ],
      ),
    );
  }
}
