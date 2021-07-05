import 'package:flutter/material.dart';
import 'package:project_gsg_1/screens/home_screens.dart';
import 'package:project_gsg_1/screens/result_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        "/home":(context) => Home(),
        "/result" : (context)=> ResultScreen(),
      },
    );
  }
}
