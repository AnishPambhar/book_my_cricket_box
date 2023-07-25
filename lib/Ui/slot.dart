import 'package:book_my_cricket_box/Ui/about.dart';
import 'package:book_my_cricket_box/Ui/payment.dart';
import 'package:book_my_cricket_box/Utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Slot extends StatefulWidget {
  final String city;
  final String title;
  final String disc;

  const Slot({Key? key, this.city = "", this.title = "", this.disc = ""})
      : super(key: key);

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  late DateTime _selectedDate;

  // Future<void> _showDatePicker(BuildContext context) async {
  //   final DateTime today = DateTime.now();
  //   final DateTime tomorrow = today.add(Duration(days: 1));
  //
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate,
  //     firstDate: today,
  //     lastDate: today.add(Duration(days: 30)),
  //     selectableDayPredicate: (DateTime date) {
  //       // Allow selection of only today and tomorrow
  //       return date.isAtSameMomentAs(today) || date.isAtSameMomentAs(tomorrow);
  //     },
  //   );
  //
  //   if (pickedDate != null) {
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   }
  // }
  Future<void> cal(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red, // Set the current date color to red
            hintColor: Colors.red, // Set the selected date color to red
            colorScheme: ColorScheme.light(primary: Colors.red),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  final fire_ref = FirebaseFirestore.instance.collection("Time").snapshots();

  // CollectionReference ref = FirebaseFirestore.instance.collection("Time");

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    getData();
  }

  bool isLoading = false;
  final List<String> bookedSlots = [];

  Future getData() async {
    setState(() {
      isLoading = true;
    });
    final data = await FirebaseFirestore.instance.collection("slot").get();
    bookedSlots.clear();
    bookedSlots.addAll(data.docs.map((e) => e.id));
    setState(() {
      isLoading = false;
    });
  }

  int today = 0;
  bool day = false;
  bool tomorrow = false;
  bool clader = false;

  String time = "";
  String price = "";
  String date = "";
  String title = "";
  String addres = "";

  DateTime currentTime = DateTime.now();

  String result = '';

  // void _compareTime() {
  //   // Format the current time to match the format of the time to compare
  //   String formattedCurrentTime = '${currentTime.hour}:${currentTime.minute} ${_getAmPm(currentTime.hour)}';
  //
  //   // Compare the times
  //   if (timeToCompare == formattedCurrentTime) {
  //     setState(() {
  //       Container(
  //         color: Colors.red,
  //         height: 100,
  //         width: 100,
  //       );
  //     });
  //   } else {
  //     setState(() {
  //       result = 'This content is not shown.';
  //     });
  //   }
  // }
  //
  // String _getAmPm(int hour) {
  //   return hour >= 12 ? 'PM' : 'AM';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(width: 10),
              Text(
                widget.city,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              // SizedBox(width: MediaQuery.of(context).size.width * 0.45),
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.red,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              Icon(
                Icons.notifications,
                color: Colors.red,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: SizedBox(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/hart.png",
                            height: 25,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          Text(widget.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54)),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on_outlined,
                              color: Colors.grey, size: 25),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.07),
                          Expanded(
                            child: Text(widget.disc,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5 Km away",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 12)),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.08),
                          Image.asset(
                            "assets/dis.png",
                            height: 18,
                            color: Colors.black54,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.01),
                          Text(
                            "Directions",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Divider(thickness: 1, indent: 30, endIndent: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        _selectedDate = DateTime.now();
                        today = 1;
                        day = !day;
                        // slots;
                      });
                    },
                    child: Text(
                      "Today",
                      style: TextStyle(
                          color: today == 1 ? Colors.red : Colors.grey),
                    )),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                InkWell(
                    onTap: () {
                      setState(() {
                        _selectedDate = DateTime.now().add(Duration(days: 1));
                        today = 2;
                        tomorrow = !tomorrow;
                        // slots;
                      });
                    },
                    child: Text(
                      "Tomorrow",
                      style: TextStyle(
                          color: today == 2 ? Colors.red : Colors.grey),
                    )),
                Spacer(),
                Text(
                  DateFormat('dd MMM yyyy').format(_selectedDate),
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.red),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                GestureDetector(
                  onTap: () {
                    cal(context);
                    setState(() {
                      today = 3;
                      clader = !clader;
                      // slots;
                    });
                  },
                  child: Icon(
                    Icons.calendar_month_outlined,
                    color: today == 3 ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          if (today == 1 || today == 2 || today == 3) ...{
            Text(
              "Choose Your Slot",
              style: TextStyle(
                  color: Colors.red, fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SizedBox(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: fire_ref,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(strokeWidth: 2);
                      }
                      if (snapshot.hasError) {
                        return Text("Some error");
                      }

                      List<Widget> slots = [];

                      snapshot.data!.docs.asMap().forEach(
                        (index, doc) {
                          late DateTime dateTime = DateFormat("h:mm a")
                              .parse(doc["titel"].toString());
                          late DateTime newDate = DateTime(
                            _selectedDate.year,
                            _selectedDate.month,
                            _selectedDate.day,
                            dateTime.hour,
                            dateTime.minute,
                          );

                          final date1 =
                              DateFormat('dd MMM ').format(_selectedDate);
                          final time1 = doc["titel"].toString() +
                              "To " +
                              doc["end"].toString();
                          final title1=widget.title;

                          final myId = getId(date1, time1,title1);

                          final isBooked = bookedSlots.contains(myId);

                          if (newDate.isAfter(currentTime)) {
                            slots.add(Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: isBooked
                                    ? (){
                                  Utils().toastmasg("This Slot is Already Booked");
                                }
                                    : () {
                                        time = time1;
                                        price = "Rs " + doc["price"].toString();
                                        date = date1;
                                        title = widget.title;
                                        addres = widget.disc;
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return About(
                                            time: time,
                                            price: price,
                                            date: date,
                                            title: title,
                                            addres: addres,
                                          );
                                        }));
                                      },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isBooked
                                        ? Colors.red.withOpacity(0.15)
                                        : Colors.green.withOpacity(0.2),
                                    border: Border.all(color: isBooked?Colors.red.withOpacity(0.5):Colors.green),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 9),
                                    child: Column(
                                      children: [
                                        Text(
                                          (doc["titel"].toString()) +
                                              "To" +
                                              (doc["end"].toString()),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          DateFormat('dd MMM ')
                                              .format(_selectedDate),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Rs " + (doc["price"].toString()),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                          }
                        },
                      );

                      return GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        children: slots,
                      );
                    },
                  ),
                ),
              ),
            ),
          },
        ],
      ),
    );
  }
}
