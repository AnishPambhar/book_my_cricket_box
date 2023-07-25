import 'package:book_my_cricket_box/Mybook_service/splash.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Splashscrren splashscrren=Splashscrren();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashscrren.isloging(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [

          PlayAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 200.0),
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
            builder: (context, value, child) {
              return Center(
                  child: Image.asset(
                    "assets/logo.png",
                    // height: MediaQuery.of(context).size.height * 0.30,
                    height: value,
                  ));
            },
          ),
        ],
      ),
    );
  }
}
