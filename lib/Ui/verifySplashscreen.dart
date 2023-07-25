import 'package:book_my_cricket_box/Mybook_service/verifySplash.dart';
import 'package:book_my_cricket_box/common/back_ground.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class Splashverify extends StatefulWidget {
  const Splashverify({Key? key}) : super(key: key);

  @override
  State<Splashverify> createState() => _SplashverifyState();
}

class _SplashverifyState extends State<Splashverify> {
  verifysuccessful verify = verifysuccessful();
  @override
  void initState() {
    // TODO: implement initState
    verify.isloging(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 200.0),
              duration: const Duration(seconds: 3),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Center(
                    child: Image.asset(
                      "assets/verify.png",
                      // height: MediaQuery.of(context).size.height * 0.30,
                      height: value,
                    ));
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Text(
              "Verification Successful",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w600, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
