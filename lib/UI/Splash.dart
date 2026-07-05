import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coreh/UI/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreen();
}

class _splashScreen extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    getData();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Core-H",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
  void getData()  async{
    var prefs =  await SharedPreferences.getInstance();
    var singin = prefs.getBool("isIn");

  }

}

