import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:project_gsg_1/screens/result_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double _bmi;
  String _bmiResult;

  void calculateBMI() {
    if(_ageController.text.isEmpty ||_weightController.text.isEmpty ||_heightController.text.isEmpty ){
       Fluttertoast.showToast(
          msg: "There are Empty Fields!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade50,
          textColor: Colors.orange,
          fontSize: 16.0
      );
    }

    setState(() {
      int _age = int.parse(_ageController.text);
      double _weight = double.parse(_weightController.text);
      double _height = double.parse(_heightController.text);

      if ((_ageController.text.isNotEmpty || _age > 0) &&
          (_weightController.text.isNotEmpty || _weight > 0) &&
          (_heightController.text.isNotEmpty || _height > 0)) {
        _bmi = ((_weight / (_height * _height)) * 10000.0);
      } else {
        _bmi = 0.0;
      }
      if (_bmi < 18.5) {
        _bmiResult = "underweight";
      } else if (_bmi >= 18.5 && _bmi < 25.0) {
        _bmiResult = "normal plonk.. good shape!";
      } else if (_bmi >= 25.0 && _bmi < 30.0) {
        _bmiResult = "overweight";
      } else {
        _bmiResult = "obese";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Padding(
        padding: EdgeInsets.only(left: 20 , right: 20 ,top: 150, ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: EdgeInsets.only(bottom: 70, left: 130),
                child: Text("BMI",
                  style: TextStyle(

                    color: Colors.orange,
                    fontSize: 50,
                    fontWeight: FontWeight.w900,

                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10 , bottom: 20),
                height: 30,
                width:100,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.stadium(),
                    depth: 4,
                    intensity: 2,

                  ),
                  child: Center(
                      child: Text(
                        'WEIGHT',
                        style: TextStyle(
                            color: Color.fromRGBO(147, 155, 162, 1),
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),


              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: _weightController ,
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    border : OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Kg',
                    suffixIcon: Icon(Icons.line_weight_outlined,
                      color: Colors.orange,
                    ),
                    //   border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),

                  ),
                ),
              ),





              Container(
                margin: EdgeInsets.only(left: 10 , bottom:20, top: 10),
                height: 30,
                width:100,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.stadium(),
                    depth: 4,
                    intensity: 2,

                  ),
                  child: Center(
                      child: Text(
                        'Height',
                        style: TextStyle(
                            color: Color.fromRGBO(147, 155, 162, 1),
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),


              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: _heightController ,
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    border : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'cm',
                    suffixIcon: Icon(Icons.height,
                      color: Colors.orange),
                    contentPadding: EdgeInsets.all(20),

                  ),
                ),
              ),




              Container(
                margin: EdgeInsets.only(left: 10 , bottom: 20 , top: 10),
                height: 30,
                width:100,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.stadium(),
                    depth: 4,
                    intensity: 2,
                  ),
                  child: Center(
                      child: Text(
                        'Age',
                        style: TextStyle(
                            color: Color.fromRGBO(147, 155, 162, 1),
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),


              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number ,
                  decoration: InputDecoration(
                    border : OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.orange, width: 5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'age',
                    suffixIcon: Icon(Icons.calendar_today,
                      color: Colors.orange),
                    contentPadding: EdgeInsets.all(20),

                  ),
                ),
              ),




              Container(
                margin: EdgeInsets.only(left: 140 , bottom: 20 , top: 10),
                height: 70,
                width:70,
                child: Neumorphic(
                  style: NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 4,
                    intensity: 2,

                  ),
                  child: Center(
                      child:IconButton(
                        onPressed: (){
                          calculateBMI();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResultScreen(
                              weightController: _weightController,
                              heightController: _heightController,
                              ageController: _ageController,
                              bmi: _bmi,
                              bmiResult: _bmiResult,

                            )),
                          );
                        },
                        icon: Icon(Icons.arrow_forward, color: Colors.orange,),
                      ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }














}
