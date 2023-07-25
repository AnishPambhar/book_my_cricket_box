import 'package:book_my_cricket_box/Ui/BoxCricket.dart';
import 'package:book_my_cricket_box/Wigets/Roundbutton.dart';
import 'package:flutter/material.dart';

import 'bottam.dart';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  List<String> city = [
    "Bangalore",
    "Mumbai",
    "Hyderabad",
    "Ahmedabad",
    "Chennai",
    "Kolkata",
    "Surat",
    "Pune",
    "Jaipur"
  ];
  String? selectedCity;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Image.asset(
                "assets/logo.png",
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Select your city",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Wrap(
                spacing: 8.0,

                children: city.map((cityName) {
                  return FilterChip(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black),
                    ),
                    selectedColor: Colors.red,


                    label: Text(cityName,),
                    selected: selectedCity == cityName,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedCity = selected ? cityName : null;

                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: RoundButton(
                  title: "Get Started",
                  onTap: () {
                    // Handle button tap
                    if (selectedCity != null) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return botam(cityName: selectedCity ?? "",);

                      }), (route) => false);
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                      //   return  Box_Cricket(cityname: selectedCity ?? "");
                      // }));

                    }


                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
