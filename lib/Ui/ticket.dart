import 'package:book_my_cricket_box/Ui/payment.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  final String title;
  final String price;
  final String time;
  final String dic;
  final String date;

  const Ticket(
      {Key? key,
      required this.title,
      required this.price,
      required this.time,
      required this.dic,
      required this.date})
      : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.red,
                    size: 40,
                  )),
              SizedBox(
                width: 20,
              ),
              Text(
                "My Ticket",
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.82,
            child: Stack(children: [
              Center(
                  child: Container(
                      child: Image.asset(
                "assets/ticket.png",
                fit: BoxFit.fitWidth,
              ))),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/hart.png",
                            height: 25,
                            color: Colors.black87,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          Text(widget.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                  fontSize: 18)),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Colors.black54, size: 25),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          Expanded(
                            child: Text(widget.dic,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          Text(widget.date,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                  fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          Text(widget.time,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                  fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text("Total Amount :" + widget.price,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.red,
                              fontSize: 20)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 90,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Payment(
                            title: widget.title,
                            address: widget.dic,
                            date: widget.date,
                            slot: widget.time,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text("Pay Now",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
