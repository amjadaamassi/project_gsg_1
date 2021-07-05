import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_container/neumorphic_container.dart';

class ResultScreen extends StatefulWidget {
  TextEditingController ageController;

  TextEditingController weightController;
  TextEditingController heightController;
  double bmi;
  String bmiResult;

  ResultScreen(
      {this.ageController,
      this.weightController,
      this.heightController,
      this.bmi,
      this.bmiResult});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding:  EdgeInsets.only(top: 20, left: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: 30,),
            onPressed: (){
              Navigator.popAndPushNamed(context, "/home");
            },
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),

            Text("  Your Result:",
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 100,),

            NeumorphicContainer(
              height: 350,
              width: 350,
              depth: 30,
              borderRadius: 20,
              primaryColor: Color(0xfff0f0f0),
              curvature: Curvature.concave,
              child: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 70, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 30,
                                  color: Colors.lightBlueAccent,
                                ),
                                Text(
                                  "${widget.ageController.text} \n year",
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.line_weight,
                                  size: 30,
                                  color: Colors.green,
                                ),
                                Text(
                                  "${widget.weightController.text} \n Kilogram",
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.height,
                                  size: 30,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  "${widget.heightController.text} \n centimeter",
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "BMI: ${widget.bmi.roundToDouble()}",
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(6.0),
                      ),
                      Text(
                        "${widget.bmiResult}",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          height: 2.0,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

