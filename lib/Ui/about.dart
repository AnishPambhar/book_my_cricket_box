import 'package:book_my_cricket_box/Ui/ticket.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  final String time;
  final String price;
  final String date;
  final String title;
  final String addres;

  const About({
    Key? key,
    this.price = "",
    this.time = "",
    this.date = "",
    this.addres = "",
    this.title = "",
  }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              aspectRatio: 364 / 128,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
              initialPage: 1,
            ),
            items: [
              Image.asset('assets/Box_1.jpeg'),
              Image.asset('assets/Box_2.jpeg'),
              Image.asset('assets/Box_3.jpeg'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    " Your  Time",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Duration",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "1 Hour",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "AVALABLE IN",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            "Crirket ball ,Crirket bat , Crirket Stump",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w700, fontSize: 14),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "Crirket Box Rules",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              "6 vs 6 or 8 vs 8 formatsFor mixed-gender matches, the number of female players must be the same in both teams etc...",
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w700, fontSize: 12),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.324,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Ticket(
                    title: widget.title,
                    price: widget.price,
                    time: widget.time,
                    dic: widget.addres,
                    date: widget.date);
              }));
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.red,
              child: Center(
                child: Text(
                  "Book Your Slot",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
