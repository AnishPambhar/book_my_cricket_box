
import 'package:book_my_cricket_box/Ui/BoxCricket.dart';
import 'package:book_my_cricket_box/Ui/offer.dart';
import 'package:book_my_cricket_box/Ui/profill.dart';
import 'package:flutter/material.dart';


class botam extends StatefulWidget {
  final String cityName;
  const botam({Key? key,this.cityName='',}) : super(key: key);

  @override
  State<botam> createState() => _botamState();
}

class _botamState extends State<botam> {
  int selectIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  Widget getPage(int index) {
    switch (index) {
      case 0:
        return Box_Cricket(
          cityname: widget.cityName,
        );
      case 1:
        return offer();
      case 2:
        return
        Profil();

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(selectIndex),
      bottomNavigationBar: Material(elevation: 5,
        child: BottomNavigationBar(
          backgroundColor: Color(0xffF3F3F3),
          onTap: onItemTapped,

          currentIndex: selectIndex,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/box.png",
                color: selectIndex == 0 ? Color(0xffE94057) : Color(0xffadafbb),
                height: 20,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/cup.png",
                color: selectIndex == 1 ? Color(0xffE94057) : Color(0xffadafbb),
                height: 20,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined,color: selectIndex == 2 ? Color(0xffE94057) : Color(0xffadafbb),
                ),
              label: "",
            ),


          ],

        ),
      ),
    );
  }
}
class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    Paint _paint = Paint()
      ..color = Colors.lightBlue
      ..strokeWidth = 5
      ..isAntiAlias = true;

    canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), _paint);
  }
}
