import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key,this.child}) : super(key: key);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return  Stack(alignment: Alignment.center, children: [
      Image.asset(
        "assets/backgroung.png",
        fit: BoxFit.fill,
        height: 800,
      ),
      Container(
        height: 780,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(200),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              blurRadius: 30.0, // soften the shadow
              spreadRadius: 20.0, //extend the shadow
            )
          ],
        ),
        child: child,
      ),
    ]);
  }
}
