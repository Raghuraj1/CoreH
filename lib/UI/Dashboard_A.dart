import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coreh/UI/login.dart';

class Adash extends StatefulWidget{
  @override
  State<Adash> createState() => _splashScreen();
}

class _splashScreen extends State<Adash>{
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 20), (){
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
              Text("Maintainance",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }

}