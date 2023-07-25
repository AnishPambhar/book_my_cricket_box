import 'package:book_my_cricket_box/Ui/BoxCricket.dart';
import 'package:book_my_cricket_box/Ui/bookedslpash.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  final String title;
  final String address;
  final String date;
  final String slot;
  const Payment(
      {Key? key,
      required this.title,
      required this.address,
      required this.date,
      required this.slot})
      : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? radioValue;
  final fire_ref = FirebaseFirestore.instance.collection("slot");
  bool loading = false;

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
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Payment",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            "Choose a payment method",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Radio(
                  value: 'paytm',
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                  activeColor:
                      Colors.red, // Set the radio button color when selected
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        "assets/paytm.png",
                        height: 30,
                        width: 40,
                      ),
                      Text(
                        "Pay Via PayTm",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Radio(
                  value: 'gpay',
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                  activeColor:
                      Colors.red, // Set the radio button color when selected
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        "assets/gpay.png",
                        height: 30,
                        width: 40,
                      ),
                      Text(
                        "Pay Via GooglePay",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Radio(
                  value: 'card',
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                  activeColor:
                      Colors.red, // // Set the radio button color when selected
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        "assets/card.png",
                        height: 30,
                        width: 40,
                      ),
                      Text(
                        "Pay Via Debit/Credit Card",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Radio(
                  value: 'other',
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                  activeColor: Colors
                      .red, //  // Set the radio button color when selected
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      Image.asset(
                        "assets/other.png",
                        height: 30,
                        width: 40,
                      ),
                      Text(
                        "Other Payment Method",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          InkWell(
            onTap: () {
              String id = getId(widget.date, widget.slot, widget.title);
              setState(() {
                loading = true;
              });
              fire_ref.doc(id).set({
                "title": widget.title,
                "address": widget.address,
                "date": widget.date,
                "slot": widget.slot,
                "id": id
              }).then((value) {
                // Utils().toastmasg("Slot bokked");
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return book();
                }), (route) => false);
                setState(() {
                  loading = false;
                });
              }).onError((error, stackTrace) {
                Utils().toastmasg(error.toString());
                setState(() {
                  loading = false;
                });
              });
            },
            child: Container(
              height: 50,
              width: 280,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text("Pay Now ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String getId(String date, String time, String title) {
  final newDate = date.replaceAll(" ", "");
  final newTime = time.replaceAll(" ", "");
  final newTitle = title.replaceAll("", "");
  return "$newDate$newTime$newTitle";
}
