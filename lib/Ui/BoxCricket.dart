import 'package:book_my_cricket_box/Ui/slot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Box_Cricket extends StatefulWidget {
  final String cityname;
  const Box_Cricket({
    Key? key,
    this.cityname = "",
  }) : super(key: key);

  @override
  State<Box_Cricket> createState() => _Box_CricketState();
}

class _Box_CricketState extends State<Box_Cricket> {
  final fire_ref = FirebaseFirestore.instance.collection("user").snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection("user");
  final search = TextEditingController();
  bool Select = false;
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
                widget.cityname,
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              // SizedBox(width: MediaQuery.of(context).size.width * 0.45),
              Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    Select = !Select;
                  });
                },
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.0),
          Select
              ? Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: TextFormField(
                    controller: search,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
              )
              : SizedBox(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(

                child: StreamBuilder<QuerySnapshot>(
                    stream: fire_ref,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator(
                          strokeWidth: 2,
                        );
                      }
                      if (snapshot.hasError) {
                        return Text("Some error");
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final titel = snapshot.data!.docs[index]['titel']
                              .toString();
                          final id =
                              snapshot.data!.docs[index]['id'].toString();
                          final add =
                              snapshot.data!.docs[index]['add'].toString();
                          if (search.text.isEmpty) {
                            return Card(
                              elevation: 2,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/hart.png",
                                            height: 25,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07),
                                          Text(titel,
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w700,
                                                  color: Colors.black54)),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on_outlined,
                                              color: Colors.grey, size: 25),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07),
                                          Expanded(
                                            child: Text(add,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w400,
                                                    color: Colors.grey)),
                                          ),
                                        ],
                                      ),Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.price_change_rounded,
                                              color: Colors.red, size: 25),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.07),
                                          Expanded(
                                            child: Text("Depend On Hours ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700,
                                                    color: Colors.red)),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                              weight: 100),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                          Text("5 Km away",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400,
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12),
                                          InkWell(onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context){
                                              return Slot(city: widget.cityname,title:titel ,disc:add ,);
                                            }));
                                          },
                                            child: Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5)),
                                              child: Center(
                                                  child: Text("View Slot",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight
                                                                  .w400))),
                                            ),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.08),
                                          Image.asset(
                                            "assets/dis.png",
                                            height: 18,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01),
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
                            );
                          } else if (titel
                              .toLowerCase()
                              .contains(search.text.toLowerCase())) {
                            return Card(
                              elevation: 2,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/hart.png",
                                            height: 25,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.07),
                                          Text(titel,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w700,
                                                  color: Colors.black45)),
                                        ],
                                      ),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.02),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.location_on_outlined,
                                              color: Colors.grey, size: 25),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.07),
                                          Expanded(
                                            child: Text(add,
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.grey)),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,
                                              color: Colors.grey,
                                              size: 20,
                                              weight: 100),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.02),
                                          Text("5 Km away",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Colors.grey,
                                                  fontSize: 12)),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.12),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    5)),
                                            child: Center(
                                                child: Text("View Slot",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight
                                                            .w400))),
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.08),
                                          Image.asset(
                                            "assets/dis.png",
                                            height: 18,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  0.01),
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
                            );
                          } else {
                            return Container();
                          }
                        },
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
