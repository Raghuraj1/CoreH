import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coreh/UI/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class DatabaseService {
  final _fire = FirebaseFirestore.instance;

  Read (User user) async {
    final data = await _fire.collection("employees").doc(user.ecode).get();
    print(data["name"]);
    print(data);
    return data;
  }
}