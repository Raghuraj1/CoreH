import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coreh/UI/login.dart';

class splashScreen extends StatefulWidget{
  @override
  State<splashScreen> createState() => _splashScreen();
}

class _splashScreen extends State<splashScreen>{
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => login() ));
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
              Text("Core-H",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }

}