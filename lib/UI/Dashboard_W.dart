import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';


class Wdash extends StatefulWidget{
  @override
  State<Wdash> createState() => _splashScreen();
}

class _splashScreen extends State<Wdash>{
  int _selectedIndex = 1;



  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body:
      Container(

        decoration: const BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2A1E24),
              Color(0xFF063C38),
            ],
          ),
        ),
      ),
      bottomNavigationBar:BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurple, // Only affects the text labels now
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon:Image.asset(
                  "assets/image/issue.png",width: 25,height: 25,),
              label: 'ISSUE'
            ),
            BottomNavigationBarItem(
                icon:Image.asset(
                  "assets/image/home.png",width: 25,height: 25,),
                label: 'HOME'
            ),
            BottomNavigationBarItem(
                icon:Image.asset(
                  "assets/image/log.png",width: 25,height: 25,),
                label: 'LOG'
            ),
          ]
      ),

    );
  }

}
