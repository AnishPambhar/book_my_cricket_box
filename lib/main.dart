import 'package:book_my_cricket_box/Ui/Signup.dart';
import 'package:book_my_cricket_box/Ui/Splash_Screen.dart';
import 'package:book_my_cricket_box/Ui/loggingWithNum.dart';
import 'package:book_my_cricket_box/Ui/selectCity.dart';
import 'package:book_my_cricket_box/Ui/ticket.dart';
import 'package:book_my_cricket_box/Ui/verifySplashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
home: Screen(),

    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TimeComparisonScreen(),
//     );
//   }
// }
//
// class TimeComparisonScreen extends StatefulWidget {
//   @override
//   _TimeComparisonScreenState createState() => _TimeComparisonScreenState();
// }
//
// class _TimeComparisonScreenState extends State<TimeComparisonScreen> {
//   String timeToCompare = '03:46 PM' ;
//   DateTime currentTime = DateTime.now();
//
//   late DateTime dateTime = DateFormat("h:mm a").parse(timeToCompare);
//   String result = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _compareTime();
//     final newDate=DateTime(currentTime.year,currentTime.month,currentTime.day,dateTime.hour,dateTime.minute);
//
//     print(newDate);
//     print(currentTime);
//     print(newDate.isBefore(currentTime));
//
//   }
//
//   void _compareTime() {
//     // Format the current time to match the format of the time to compare
//     String formattedCurrentTime = '${currentTime.hour}:${currentTime.minute} ${_getAmPm(currentTime.hour)}';
//
//     // Compare the times
//     if (timeToCompare == formattedCurrentTime) {
//       setState(() {
//         Container(
//           color: Colors.red,
//           height: 100,
//           width: 100,
//         );
//       });
//     } else {
//       setState(() {
//         result = 'This content is not shown.';
//       });
//     }
//   }
//
//   String _getAmPm(int hour) {
//     return hour >= 12 ? 'PM' : 'AM';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Time Comparison'),
//       ),
//       body: Center(
//         child: Text(result),
//       ),
//     );
//   }
// }


